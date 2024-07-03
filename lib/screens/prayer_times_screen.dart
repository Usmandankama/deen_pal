import 'package:flutter/material.dart';
import 'package:deen_pal/components/prayer_tile.dart';
import 'package:deen_pal/services/prayer_times.dart';
import 'package:deen_pal/constants/colors.dart' as colors;
import 'package:table_calendar/table_calendar.dart';


class PrayerTimesScreen extends StatefulWidget {
  const PrayerTimesScreen({Key? key}) : super(key: key);

  @override
  PrayerTimesScreenState createState() => PrayerTimesScreenState();
}

class PrayerTimesScreenState extends State<PrayerTimesScreen> {
  final PrayerTimesService _prayerTimesService = PrayerTimesService();
  Future<Map<String, dynamic>>? _prayerTimes;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;


  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    // Fetch the prayer times when the widget is initialized
    _prayerTimes = _prayerTimesService.fetchPrayerTimes();
  }



  // Method to handle location selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.primaryColor,
      appBar: AppBar(
        foregroundColor: colors.fontColorLight,
        elevation: 0,
        backgroundColor: colors.primaryColor,
        centerTitle: true,
        title: Text(
          'Prayer Times',
        ), // Show selected location in title
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
                  color: colors.fontColorLight,
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
                          color: colors.primaryColor,
                        ),
                        height: constraints.maxHeight * 0.3,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TableCalendar(
                            firstDay: DateTime.utc(2020, 1, 1),
                            lastDay: DateTime.utc(2030, 12, 31),
                            focusedDay: _focusedDay,
                            calendarFormat: CalendarFormat.week,
                            selectedDayPredicate: (day) {
                              return isSameDay(_selectedDay, day);
                            },
                            onDaySelected: (selectedDay, focusedDay) {
                              if (!isSameDay(_selectedDay, selectedDay)) {
                                setState(() {
                                  _selectedDay = selectedDay;
                                  _focusedDay = focusedDay;
                                });
                              }
                            },
                            onPageChanged: (focusedDay) {
                              _focusedDay = focusedDay;
                            },
                            calendarStyle: CalendarStyle(
                              outsideDaysVisible: false,
                              markersMaxCount: 3,
                              todayDecoration: BoxDecoration(
                                color: colors.secondaryColor,
                                shape: BoxShape.circle,
                              ),
                              selectedDecoration: const BoxDecoration(
                                color: Colors.orangeAccent,
                                shape: BoxShape.circle,
                              ),
                              defaultTextStyle:
                                  const TextStyle(color: Colors.white),
                              weekendTextStyle:
                                  const TextStyle(color: Colors.white70),
                            ),
                            headerStyle: HeaderStyle(
                              formatButtonVisible: false,
                              titleTextStyle: TextStyle(
                                color: colors.primaryColor,
                                fontSize: 20,
                              ),
                              leftChevronVisible: false,
                              rightChevronVisible: false,
                            ),
                            availableCalendarFormats: const {
                              CalendarFormat.week: 'Week',
                            },
                          ),
                        ),
                      ),
                    ),
                    // Main content
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Align(
                        alignment: Alignment.center,
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
