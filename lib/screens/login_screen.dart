import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:social_media_app/firebase_helper/firebase_auth_helper.dart';
import 'package:social_media_app/screens/home_screen.dart';
import 'package:social_media_app/screens/widgets/screen_title.dart';
import 'package:social_media_app/screens/widgets/splash_logo.dart';
import 'package:social_media_app/constants/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // controllers
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _showPassword = false; // show password
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80.0),
              const ScreenTitle(
                title: 'Welcome Back  👋',
                subTitle: 'Login into your account to continue',
              ),
              const Logo(),
              TextField(
                controller: mobileController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                obscureText: !_showPassword,
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _showPassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
              TextButton(
                style: mainButtonStyle,
                onPressed: () async {
                  final mobile = mobileController.text;
                  final password = passwordController.text;

                  bool isLogin =
                      await FirebaseAuthHelper.instance.login(mobile, password);

                  if (isLogin) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
                  } 
                },
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'LogIn',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: GestureDetector(
                  onTap: () {     
                    // todo : create user
                                        Navigator.pushNamed(context, '/register');

                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      color: kBlueColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
