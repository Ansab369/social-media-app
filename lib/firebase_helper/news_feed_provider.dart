import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/model/news_feed_model.dart';

class NewsFeedProvider with ChangeNotifier {
  final String apiKey = '672519891e2047ae95c6afb1c9f27446'; // API key
  final String apiUrl =
      'https://newsapi.org/v2/everything?q=tesla&from=2023-10-22&sortBy=publishedAt&apiKey='; // API endpoint

  Dio _dio = Dio();

  List<NewsArticle> newsList = [];

  Future<List<NewsArticle>> getNews() async {
    try {
      final Response response = await Dio(BaseOptions()).get(
          "https://newsapi.org/v2/everything?q=tesla&from=2023-10-22&sortBy=publishedAt&apiKey=672519891e2047ae95c6afb1c9f27446");

      if (response.statusCode == 200) {
        final List<dynamic> articlesData = response.data['articles'];
        newsList = articlesData.map((articleJson) {
          return NewsArticle.fromJson(articleJson);
        }).toList();

        notifyListeners();

        return newsList;
      } else {
        throw Exception('Failed to fetch news');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}
