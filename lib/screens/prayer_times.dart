import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart'; // Import Geolocator package
import 'package:geocoding/geocoding.dart'; // Import geocoding package
import 'package:deen_pal/components/prayer_tile.dart';
import 'package:deen_pal/services/prayer_times.dart';
import 'package:deen_pal/constants/colors.dart' as colors;

class PrayerTimesScreen extends StatefulWidget {
  const PrayerTimesScreen({Key? key}) : super(key: key);

  @override
  _PrayerTimesScreenState createState() => _PrayerTimesScreenState();
}

class _PrayerTimesScreenState extends State<PrayerTimesScreen> {
  final PrayerTimesService _prayerTimesService = PrayerTimesService();
  Future<Map<String, dynamic>>? _prayerTimes;
  String _selectedLocation = 'Current Location'; // Default location

  @override
  void initState() {
    super.initState();
    // Fetch the prayer times when the widget is initialized
    _prayerTimes = _prayerTimesService.fetchPrayerTimes();
  }

  // Method to get the device's current location
Future<void> _getCurrentLocation() async {
  Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.medium,
  );

  // Use reverse geocoding to get the nearest city
  List<Placemark> placemarks = await placemarkFromCoordinates(
    position.latitude,
    position.longitude,
  );

  // Extract the city name from the placemark
  String nearestCity = placemarks.isNotEmpty ? placemarks[0].locality ?? '' : '';

  print('Current location: $nearestCity');
  
  setState(() {
    _selectedLocation = nearestCity.isNotEmpty ? nearestCity : 'Unknown';
  });
}

  // Method to handle location selection
  void _selectLocation() async {
    // Automatically fetch the current location
    await _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.primaryColor,
      appBar: AppBar(
        foregroundColor: colors.fontColorLight,
        elevation: 0,
        backgroundColor: colors.accentColor,
        centerTitle: true,
        title: Text('Prayer Times - $_selectedLocation'), // Show selected location in title
        actions: [
          IconButton(
            icon: const Icon(Icons.location_on),
            onPressed: _selectLocation, // Handle location selection
            tooltip: 'Select Location',
          ),
        ],
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _prayerTimes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while the data is being fetched
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Show an error message if there is a network error
            return Center(
              child: Text(
                'Network error',
                style: TextStyle(
                  color: colors.fontColorDark,
                  fontSize: 25,
                  fontFamily: 'Poppins',
                ),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data == null) {
            // Show a message if no data is available
            return const Center(child: Text('No data available'));
          } else {
            var times = snapshot.data!['items'][0];
            return LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    // Top decoration
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          color: colors.accentColor,
                        ),
                        height: constraints.maxHeight * 0.3,
                        width: double.infinity,
                      ),
                    ),
                    // Main content
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: constraints.maxHeight * 0.6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: colors.primaryColor,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                spreadRadius: 2,
                                color: Colors.black.withOpacity(.5),
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Prayer time tiles
                              PrayerTile(
                                text: 'Fajr',
                                imagePath: 'assets/icons/sunrise.png',
                                pryarTime: times['fajr'],
                              ),
                              PrayerTile(
                                text: 'Dhuhr',
                                imagePath: 'assets/icons/sun.png',
                                pryarTime: times['dhuhr'],
                              ),
                              PrayerTile(
                                text: 'Asr',
                                imagePath: 'assets/icons/afternoon.png',
                                pryarTime: times['asr'],
                              ),
                              PrayerTile(
                                text: 'Maghrib',
                                imagePath: 'assets/icons/sunset2.png',
                                pryarTime: times['maghrib'],
                              ),
                              PrayerTile(
                                text: 'Isha',
                                imagePath: 'assets/icons/night.png',
                                pryarTime: times['isha'],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
