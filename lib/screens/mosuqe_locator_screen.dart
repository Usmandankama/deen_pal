// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:deen_pal/constants/colors.dart' as colors;
// import 'package:permission_handler/permission_handler.dart';

// class MosqueLocatorScreen extends StatefulWidget {
//   const MosqueLocatorScreen({super.key});

//   @override
//   _MosqueLocatorScreenState createState() => _MosqueLocatorScreenState();
// }

// class _MosqueLocatorScreenState extends State<MosqueLocatorScreen> {
//   late GoogleMapController _mapController;
//   Position? _currentPosition;
//   final Set<Marker> _markers = {};

//   @override
//   void initState() {
//     super.initState();
//     _checkLocationPermissions();
//   }

//   Future<void> _checkLocationPermissions() async {
//     if (await Permission.locationWhenInUse.request().isGranted) {
//       _getCurrentLocation();
//     } else if (await Permission.locationWhenInUse.isDenied) {
//       _showPermissionDeniedDialog();
//     } else if (await Permission.locationWhenInUse.isPermanentlyDenied) {
//       await openAppSettings();
//     }
//   }

//   void _showPermissionDeniedDialog() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Permission Denied'),
//         content: const Text('Location permissions are denied. Please enable them in the app settings.'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _getCurrentLocation() async {
//     Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//     setState(() {
//       _currentPosition = position;
//     });
//     _mapController.animateCamera(CameraUpdate.newLatLng(
//       LatLng(position.latitude, position.longitude),
//     ));
//     _fetchNearbyMosques();
//   }

//   Future<void> _fetchNearbyMosques() async {
//     if (_currentPosition == null) return;

//     const String apiKey = 'YOUR_GOOGLE_MAPS_API_KEY';
//     final String url =
//         'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${_currentPosition!.latitude},${_currentPosition!.longitude}&radius=2000&type=mosque&key=$apiKey';

//     final response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       final List<dynamic> places = data['results'];

//       setState(() {
//         _markers.clear();
//         for (var place in places) {
//           final marker = Marker(
//             markerId: MarkerId(place['place_id']),
//             position: LatLng(place['geometry']['location']['lat'], place['geometry']['location']['lng']),
//             infoWindow: InfoWindow(
//               title: place['name'],
//               snippet: place['vicinity'],
//             ),
//           );
//           _markers.add(marker);
//         }
//       });
//     } else {
//       throw Exception('Failed to load nearby mosques');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: colors.accentColor,
//       appBar: AppBar(
//         title: const Text(
//           'Mosque Locator',
//           style: TextStyle(fontFamily: 'Poppins'),
//         ),
//         centerTitle: true,
//         backgroundColor: colors.accentColor,
//       ),
//       body: _currentPosition == null
//           ? const Center(child: CircularProgressIndicator())
//           : GoogleMap(
//               onMapCreated: (controller) {
//                 _mapController = controller;
//               },
//               initialCameraPosition: CameraPosition(
//                 target: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
//                 zoom: 14,
//               ),
//               markers: _markers,
//             ),
//     );
//   }
// }
