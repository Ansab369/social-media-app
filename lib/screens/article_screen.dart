// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:social_media_app/model/news_feed_model.dart';

class ArticleScreen extends StatelessWidget {
  final NewsArticle newsItem;
  const ArticleScreen({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    String originalDateString = newsItem.publishedAt.toString();
    String formattedDate =
        DateFormat('dd-MM-yyyy').format(DateTime.parse(originalDateString));
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            foregroundDecoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Colors.black87,
                  Colors.black
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 0.2, 0.8, 1],
              ),
            ),
            child: Image.network('${newsItem.urlToImage}', fit: BoxFit.cover),
          ),
          Positioned(
            left: 10,
            top: 75,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: const CircleAvatar(
                backgroundColor: Colors.black54,
                radius: 30,
                child: Icon(Icons.keyboard_arrow_left),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '${newsItem.title}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text('${newsItem.author}',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16)),
                    ),
                    Text(formattedDate,
                        style: const TextStyle(
                            color: Colors.white54,
                            fontSize: 16,
                            fontWeight: FontWeight.bold))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text('${newsItem.description}',
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 672519891e2047ae95c6afb1c9f27446

// https://newsapi.org/v2/everything?q=Apple&from=2023-11-22&sortBy=popularity&apiKey=API_KEY