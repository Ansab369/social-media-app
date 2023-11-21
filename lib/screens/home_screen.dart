


import 'package:flutter/material.dart';
import 'package:social_media_app/firebase_helper/firebase_data_helper.dart';
import 'package:social_media_app/screens/widgets/post_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    getDataFromPostsCollection();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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



