import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/screens/home_screen.dart';
import 'package:social_media_app/screens/login_screen.dart';
import 'package:social_media_app/screens/screen_home_main_page.dart';
import 'package:social_media_app/screens/widgets/splash_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoggedIn = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    // checkLoginStatus();
    navigateToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Logo(),
    );
  }

  void navigateToNextScreen() {
    // Delay the navigation for a certain duration if needed
    Future.delayed(Duration(seconds: 2), () {
      if (_auth.currentUser != null) {
        // User is already logged in
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ScreenMainPage()),
        );
      } else {
        // User is not logged in
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    });
  }

 
 
}
