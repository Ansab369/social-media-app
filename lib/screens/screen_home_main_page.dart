import 'package:flutter/material.dart';
import 'package:social_media_app/screens/home_screen.dart';
import 'package:social_media_app/screens/news_feed_screen.dart';
import 'package:social_media_app/screens/profile_screen.dart';
import 'package:social_media_app/screens/widgets/bottom_nav_bar.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key}) : super(key: key);

  final _pages = [
    HomeScreen(),
    // SearchScreen(),
    // ReelsScreen(),
    NewsFeedScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int newIndex, _) {
            return _pages[newIndex];
          }),
      bottomNavigationBar: BottonNavigationBarWidget(),
    );
  }
}