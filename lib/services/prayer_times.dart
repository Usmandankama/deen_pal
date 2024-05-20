import 'dart:convert';
import 'package:http/http.dart' as http;

class PrayerTimesService {
  final String _apiUrl = 'http://muslimsalat.com/Abuja.json';

  Future<Map<String, dynamic>> fetchPrayerTimes() async {
    final response = await http.get(Uri.parse(_apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load prayer times');
    }
  }
}
