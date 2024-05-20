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

  @override
  void initState() {
    super.initState();
    _prayerTimes = _prayerTimesService.fetchPrayerTimes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.primaryColor,
      appBar: AppBar(
        // foregroundColor: colors.fontColorDark,
        foregroundColor: colors.fontColorLight,
        // backgroundColor: colors.primaryColor,
        elevation: 0,
        backgroundColor: colors.accentColor,
        centerTitle: true,
        title: const Text('Prayer Times'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _prayerTimes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Network error',
                style: TextStyle(
                    color: colors.fontColorDark,
                    fontSize: 25,
                    fontFamily: 'Poppins'),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('No data available'));
          } else {
            var times = snapshot.data!['items'][0];
            return Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      color: colors.accentColor,
                    ),
                    height: 200,
                    width: 500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 50,
                    bottom: 20,
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: colors.primaryColor,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            spreadRadius: 2,
                            color: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(.5),
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
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
          }
        },
      ),
    );
  }
}
