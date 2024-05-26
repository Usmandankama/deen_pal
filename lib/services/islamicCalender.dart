import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/islamicDate.dart';

Future<IslamicDate> fetchIslamicDate() async {
  final response = await http.get(Uri.parse('http://api.aladhan.com/v1/gToH?date=${DateTime.now().toIso8601String().split('T')[0]}'));

  if (response.statusCode == 200) {
    final data = json.decode(response.body)['data'];
    return IslamicDate.fromJson(data);
  } else {
    throw Exception('Failed to load Islamic date');
  }
}
