import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class PrayerTimesService {
  String? _userLocation;
  static const String _baseUrl = 'http://muslimsalat.com/';

  Future<void> _fetchUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, do not continue.
      print('Location services are disabled.');
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, do not continue.
        print('Location permissions are denied.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      print('Location permissions are permanently denied.');
      return;
    }

    // When we reach here, permissions are granted and we can continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // Get the city name from the coordinates
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    if (placemarks.isNotEmpty) {
      Placemark place = placemarks[0];
      _userLocation = place.locality;
    }
    print('User Location: $_userLocation');
  }

  Future<Map<String, dynamic>> fetchPrayerTimes() async {
    await _fetchUserLocation(); // Ensure location is fetched before making the API call

    if (_userLocation == null) {
      throw Exception('Failed to fetch user location');
    }

    final String apiUrl = '$_baseUrl$_userLocation.json';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load prayer times');
    }
  }
}
