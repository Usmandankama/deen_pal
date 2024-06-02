import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:deen_pal/constants/colors.dart' as colors;
import '../models/news_article.dart';

class FeaturedArticles extends StatefulWidget {
  const FeaturedArticles({super.key});

  @override
  State<FeaturedArticles> createState() => _FeaturedArticlesState();
}

class _FeaturedArticlesState extends State<FeaturedArticles> {
  List<NewsArticle> _articles = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetchArticles();
  }

  Future<void> _fetchArticles() async {
    const apiKey = '42503ad27d5f4e60a0ae3c45b6d5c409';  // Replace with your NewsAPI key
    final response = await http.get(Uri.parse(
      'https://newsapi.org/v2/everything?q=islamic&apiKey=$apiKey'
    ));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['articles'];
      setState(() {
        _articles = data.map((json) => NewsArticle.fromJson(json)).toList();
        _loading = false;
      });
    } else {
      throw Exception('Failed to load news');
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 150,
      width: deviceWidth,
      decoration: BoxDecoration(
        color: colors.secondaryColor,
      ),
      child: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _articles.length,
              itemBuilder: (context, index) {
                final article = _articles[index];
                return _buildArticleItem(article);
              },
            ),
    );
  }

  Widget _buildArticleItem(NewsArticle article) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: colors.tileColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.imageUrl.isNotEmpty)
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.network(article.imageUrl, height: 100, width: 300, fit: BoxFit.cover),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                article.title,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  color: colors.fontColorLight,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                article.description,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: colors.fontColorLight.withOpacity(0.7),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
