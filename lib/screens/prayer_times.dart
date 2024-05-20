import 'package:flutter/material.dart';
import '../services/prayer_times.dart';
import 'package:deen_pal/constants/colors.dart' as colors;

// class PrayerTimes extends StatefulWidget {
//   const PrayerTimes({super.key});

//   @override
//   State<PrayerTimes> createState() => _PrayerTimesState();
// }

// class _PrayerTimesState extends State<PrayerTimes> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: colors.accentColor,
//       appBar: AppBar(

//         elevation: 0,
//         title: const Text(
//           'Prayer TImes',
//           style: TextStyle(
//             fontSize: 20,
//             fontFamily: 'Poppins',
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: colors.primaryColor,
//               borderRadius: const BorderRadius.only(
//                 bottomLeft: Radius.circular(20),
//                 bottomRight: Radius.circular(20),
//               ),
//             ),
//             width: 500,
//             height: 150,
//           ),
//           // const SizedBox(height: 5),
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: L
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ListTile(
//               tileColor: colors.tileColor,
//               title: Text(
//                 'Subhi',
//                 style: TextStyle(
//                   color: colors.fontColorLight,
//                   fontSize: 18,
//                 ),
//               ),
//               leading: Image.asset('assets/icons/sun.png', scale: 15),
//               trailing: Text(
//                 '12:00 am',
//                 style: TextStyle(
//                   color: colors.fontColorLight,
//                   fontFamily: 'Poppins',
//                   fontSize: 20,
//                 ),
//               ),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ListTile(
//               tileColor: colors.tileColor,
//               title: Text(
//                 'Subhi',
//                 style: TextStyle(
//                   color: colors.fontColorLight,
//                   fontSize: 18,
//                 ),
//               ),
//               leading: Image.asset('assets/icons/sun.png', scale: 15),
//               trailing: Text(
//                 '12:00 am',
//                 style: TextStyle(
//                   color: colors.fontColorLight,
//                   fontFamily: 'Poppins',
//                   fontSize: 20,
//                 ),
//               ),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ListTile(
//               tileColor: colors.tileColor,
//               title: Text(
//                 'Subhi',
//                 style: TextStyle(
//                   color: colors.fontColorLight,
//                   fontSize: 18,
//                 ),
//               ),
//               leading: Image.asset('assets/icons/sunset.png', scale: 15),
//               trailing: Text(
//                 '12:00 am',
//                 style: TextStyle(
//                   color: colors.fontColorLight,
//                   fontFamily: 'Poppins',
//                   fontSize: 20,
//                 ),
//               ),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ListTile(
//               tileColor: colors.tileColor,
//               title: Text(
//                 'Subhi',
//                 style: TextStyle(
//                   color: colors.fontColorLight,
//                   fontSize: 18,
//                 ),
//               ),
//               leading: Image.asset('assets/icons/night.png', scale: 15),
//               trailing: Text(
//                 '12:00 am',
//                 style: TextStyle(
//                   color: colors.fontColorLight,
//                   fontFamily: 'Poppins',
//                   fontSize: 20,
//                 ),
//               ),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
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
      backgroundColor: colors.accentColor,
      appBar: AppBar(
        backgroundColor: colors.accentColor,
        foregroundColor: colors.fontColorLight,
        centerTitle: true,
        title: const Text('Prayer Times'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _prayerTimes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('No data available'));
          } else {
            var times = snapshot.data!['items'][0];
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    tileColor: colors.tileColor,
                    title: Text(
                      'Fajr',
                      style: TextStyle(
                        color: colors.fontColorLight,
                        fontSize: 18,
                      ),
                    ),
                    leading: Image.asset('assets/icons/sunrise.png', scale: 15),
                    trailing: Text(
                      times['fajr'],
                      style: TextStyle(
                        color: colors.fontColorLight,
                        fontFamily: 'Poppins',
                        fontSize: 20,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    tileColor: colors.tileColor,
                    title: Text(
                      'Dhuhr',
                      style: TextStyle(
                        color: colors.fontColorLight,
                        fontSize: 18,
                      ),
                    ),
                    leading: Image.asset('assets/icons/sun.png', scale: 15),
                    trailing: Text(
                      times['dhuhr'],
                      style: TextStyle(
                        color: colors.fontColorLight,
                        fontFamily: 'Poppins',
                        fontSize: 20,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    tileColor: colors.tileColor,
                    title: Text(
                      'Asr',
                      style: TextStyle(
                        color: colors.fontColorLight,
                        fontSize: 18,
                      ),
                    ),
                    leading: Image.asset('assets/icons/afternoon.png', scale: 15),
                    trailing: Text(
                      times['asr'],
                      style: TextStyle(
                        color: colors.fontColorLight,
                        fontFamily: 'Poppins',
                        fontSize: 20,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    tileColor: colors.tileColor,
                    title: Text(
                      'Maghrib',
                      style: TextStyle(
                        color: colors.fontColorLight,
                        fontSize: 18,
                      ),
                    ),
                    leading: Image.asset('assets/icons/sunset.png', scale: 15),
                    trailing: Text(
                      times['maghrib'],
                      style: TextStyle(
                        color: colors.fontColorLight,
                        fontFamily: 'Poppins',
                        fontSize: 20,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    tileColor: colors.tileColor,
                    title: Text(
                      'Isha',
                      style: TextStyle(
                        color: colors.fontColorLight,
                        fontSize: 18,
                      ),
                    ),
                    leading: Image.asset('assets/icons/night.png', scale: 15),
                    trailing: Text(
                      times['isha'],
                      style: TextStyle(
                        color: colors.fontColorLight,
                        fontFamily: 'Poppins',
                        fontSize: 20,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
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
