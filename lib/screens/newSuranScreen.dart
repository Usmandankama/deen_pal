import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class QuranPageScreen extends StatefulWidget {
  final int pageNumber;

  QuranPageScreen({required this.pageNumber});

  @override
  _QuranPageScreenState createState() => _QuranPageScreenState();
}

class _QuranPageScreenState extends State<QuranPageScreen> {
  Map<String, dynamic>? pageData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchQuranPage();
  }

  Future<void> fetchQuranPage() async {
    final response = await http.get(
        Uri.parse('https://api.alquran.cloud/v1/page/${widget.pageNumber}/quran-uthmani'));

    if (response.statusCode == 200) {
      setState(() {
        pageData = json.decode(response.body)['data'];
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load Quran page');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quran Page ${widget.pageNumber}'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: pageData?['ayahs'].length ?? 0,
              itemBuilder: (context, index) {
                final ayah = pageData!['ayahs'][index];
                return ListTile(
                  title: Text(ayah['text']),
                );
              },
            ),
    );
  }
}
