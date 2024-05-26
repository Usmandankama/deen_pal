import 'package:flutter/material.dart';
import 'package:deen_pal/constants/colors.dart' as colors;
import 'package:intl/intl.dart';

import '../models/islamicDate.dart';
import '../services/islamicCalender.dart';

class IslamicCalendarScreen extends StatefulWidget {
  const IslamicCalendarScreen({Key? key}) : super(key: key);

  @override
  _IslamicCalendarScreenState createState() => _IslamicCalendarScreenState();
}

class _IslamicCalendarScreenState extends State<IslamicCalendarScreen> {
  Future<IslamicDate>? _islamicDate;

  @override
  void initState() {
    super.initState();
    _islamicDate = fetchIslamicDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.accentColor,
      appBar: AppBar(
        title: const Text(
          'Islamic Calendar',
          style: TextStyle(fontFamily: 'Poppins'),
        ),
        centerTitle: true,
        backgroundColor: colors.accentColor,
      ),
      body: Center(
        child: FutureBuilder<IslamicDate>(
          future: _islamicDate,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData) {
              return const Text('No data available');
            } else {
              final islamicDate = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: colors.tileColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        spreadRadius: 1,
                        offset: const Offset(0, 10),
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Gregorian Date: ${DateFormat.yMMMMd().format(DateTime.now())}',
                          style: TextStyle(
                            color: colors.fontColorLight,
                            fontSize: 20,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Islamic Date: ${islamicDate.hijriDate}',
                          style: TextStyle(
                            color: colors.fontColorLight,
                            fontSize: 20,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
