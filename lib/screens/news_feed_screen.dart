

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/firebase_helper/firebase_data_helper.dart';
import 'package:social_media_app/firebase_helper/news_feed_provider.dart';
import 'package:social_media_app/model/news_feed_model.dart';
import 'package:social_media_app/screens/article_screen.dart';


class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
     NewsFeedProvider newsFeedProvider =
        Provider.of<NewsFeedProvider>(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      newsFeedProvider.getNews();
    });
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Image.asset('assets/logo2.png'),
      ),
      body: SafeArea(
        child: 
            // if (state.isLoading) {
            //   return Center(child: CircularProgressIndicator());
            // } else if (state.isError) {
            //   return Center(child: Text('Some Error Occurd'));
            // }
             ListView.builder(
              itemCount:newsFeedProvider.newsList.length,
              itemBuilder: (context, index) {
                final newsItem = newsFeedProvider.newsList[index];
                return GestureDetector(
                  onTap: () {
                    navigateToArticleDetailPage(context, newsItem);
                  },
                  child: NewsCard(
                    newsItem: newsItem,
                  ),
                );
              },
            ),
        
      ),
    );
  }
}

void navigateToArticleDetailPage(BuildContext context, newsItem) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return ArticleScreen(
      newsItem: newsItem,
      // article: article,
    );
  }));
}

class NewsCard extends StatelessWidget {
  final NewsArticle newsItem;
  const NewsCard({
    Key? key,
    required this.newsItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String originalDateString = newsItem.publishedAt.toString();
    String formattedDate =
        DateFormat('dd-MM-yyyy').format(DateTime.parse(originalDateString));
    return Container(
      margin: const EdgeInsets.all(15),
      width: double.infinity,
      height: 230,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage('${newsItem.urlToImage}'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.5, 1],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${newsItem.title}",
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${newsItem.author}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      formattedDate,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}