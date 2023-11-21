import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

void addUserData(
    String userId, String name, String email,
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