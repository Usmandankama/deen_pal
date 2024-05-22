import 'package:deen_pal/components/prayer_tile.dart';
import 'package:flutter/material.dart';
import '../services/prayer_times.dart';
import 'package:deen_pal/constants/colors.dart' as colors;

class PrayerTimesScreen extends StatefulWidget {
  const PrayerTimesScreen({super.key});

  @override
  PrayerTimesScreenState createState() => PrayerTimesScreenState();
}

class PrayerTimesScreenState extends State<PrayerTimesScreen> {
  final PrayerTimesService _prayerTimesService = PrayerTimesService();
  Future<Map<String, dynamic>>? _prayerTimes;
  String _selectedLocation = 'Current Location'; // Default location

  @override
  void initState() {
    super.initState();
    // Fetch the prayer times when the widget is initialized
    _prayerTimes = _prayerTimesService.fetchPrayerTimes();
  }

  // Method to handle location selection
  void _selectLocation() async {
    // Simulate fetching user's location from a dialog or screen
    String? location = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        // This could be a dialog or a screen for location selection
        return AlertDialog(
          title: Text('Select Location'),
          content: Text('Please select your location'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop('New York'); // Example location choice
              },
              child: Text('New York'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop('London'); // Example location choice
              },
              child: Text('London'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop('Paris'); // Example location choice
              },
              child: Text('Paris'),
            ),
          ],
        );
      },
    );

    // Update selected location if a location is chosen
    if (location != null) {
      setState(() {
        _selectedLocation = location;
      });
    }
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
