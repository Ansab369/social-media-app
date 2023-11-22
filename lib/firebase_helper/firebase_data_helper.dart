import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/model/post_model.dart';


class SocialMediaProvider with ChangeNotifier {
  

// while SignIn/ register
void addUserData(
  String userId,
  String name,
  String email,
) async {
  try {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    Future<void> meetingCollection =
        firestore.collection('users').doc(userId).set({
      'userId': userId,
      'name': name,
      'email': email,
    });
  } catch (error) {
    print('Error adding meeting document: $error');
  }
}


// get posts
final List<Post> posts = [];

Future<void> getDataFromPostsCollection() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    QuerySnapshot querySnapshot = await firestore.collection('posts').get();

    if (querySnapshot.docs.isNotEmpty) {
      posts.clear();

      querySnapshot.docs.forEach((document) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        
        Post post = Post.fromMap(data);
        posts.add(post);
         notifyListeners();

        print('Data from document ${document.id}: $data');
      });
      log(posts.length.toString());
      log("-----------------");
    } else {
      print('No documents found in the "posts" collection.');
    }
  } catch (e) {
    print('Error getting data from Firestore: $e');
  }
}
}

