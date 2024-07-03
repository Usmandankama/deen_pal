import 'package:flutter/material.dart';
import 'package:deen_pal/constants/colors.dart' as colors;
import 'package:deen_pal/services/prayer_times.dart';
import 'dart:async';

class NextPrayer extends StatefulWidget {
  const NextPrayer({super.key});

  @override
  State<NextPrayer> createState() => _NextPrayerState();
}

class _NextPrayerState extends State<NextPrayer> {
  final PrayerTimesService _prayerTimesService = PrayerTimesService();
  Map<String, dynamic>? _prayerTimes;
  String _nextPrayer = 'Loading...';
  String _timeLeft = '';

  @override
  void initState() {
    super.initState();
    _fetchPrayerTimes();
  }

  Future<void> _fetchPrayerTimes() async {
    try {
      final prayerTimes = await _prayerTimesService.fetchPrayerTimes();
      setState(() {
        _prayerTimes = prayerTimes;
        _updateNextPrayer();
      });
    } catch (e) {
      setState(() {
        _nextPrayer = 'Error loading prayer times';
      });
      print('Failed to fetch prayer times: $e');
    }
  }

  void _updateNextPrayer() {
    if (_prayerTimes == null) return;

    final now = DateTime.now();

    final times = [
      'fajr',
      'dhuhr',
      'asr',
      'maghrib',
      'isha',
    ].map((key) => _parseTime(_prayerTimes!['items'][0][key])).toList();

    DateTime? nextPrayerTime;
    String nextPrayerName = '';

    for (var i = 0; i < times.length; i++) {
      if (now.isBefore(times[i])) {
        nextPrayerTime = times[i];
        nextPrayerName = [
          'Fajr',
          'Dhuhr',
          'Asr',
          'Maghrib',
          'Isha'
        ][i];
        break;
      }
    }

    if (nextPrayerTime == null) {
      nextPrayerTime = times.first.add(const Duration(days: 1));
      nextPrayerName = 'Fajr';
    }

    final duration = nextPrayerTime.difference(now);
    setState(() {
      _nextPrayer = nextPrayerName;
      _timeLeft = '${duration.inHours}:${(duration.inMinutes % 60).toString().padLeft(2, '0')} left';
    });
  }

  DateTime _parseTime(String time) {
    final now = DateTime.now();
    final parts = time.split(':');
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);
    return DateTime(now.year, now.month, now.day, hour, minute);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color.fromARGB(229, 255, 255, 255),
      ),
      height: 220,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            'Next Prayer',
            style: TextStyle(
              color: colors.fontColorDark,
              fontSize: 25,
              fontFamily: 'Poppins',
            ),
          ),
          Text(
            _prayerTimes != null 
                ? '$_nextPrayer: ${_prayerTimes!['items'][0][_nextPrayer.toLowerCase()] ?? ''}'
                : 'Loading...',
            style: TextStyle(
              color: colors.fontColorDark,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 5),
          Text(
            _timeLeft,
            style: TextStyle(
              color: colors.fontColorDark,
              fontSize: 20,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
