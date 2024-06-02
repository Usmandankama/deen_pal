import 'dart:convert';
import 'package:http/http.dart' as http;

class IslamicDate {
  final String hijriDate;

  IslamicDate({required this.hijriDate});

  factory IslamicDate.fromJson(Map<String, dynamic> json) {
    return IslamicDate(
      hijriDate: json['data']['hijri']['date'],
    );
  }

  static Future<IslamicDate> fetchIslamicDate(DateTime date) async {
    final response = await http.get(
      Uri.parse(
        'http://api.aladhan.com/v1/gToH?date=${date.toString().split(' ')[0]}',
      ),
    );

    if (response.statusCode == 200) {
      return IslamicDate.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Islamic date');
    }
  }
}
