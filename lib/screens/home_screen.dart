import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/firebase_helper/firebase_data_helper.dart';
import 'package:social_media_app/screens/widgets/post_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SocialMediaProvider socialProvider =
        Provider.of<SocialMediaProvider>(context);

    socialProvider.getDataFromPostsCollection();

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Image.asset(
            'assets/logo.png',
            fit: BoxFit.contain,
            height: 32,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add_box_outlined, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.favorite_border, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.chat_outlined, color: Colors.black),
              onPressed: () {},
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: ListView(
          children: const [
            SizedBox(height: 5),
            // StatusBar(),
            Divider(),
            PostWidget(),
          ],
        ));
  }
}
