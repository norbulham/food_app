import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_app/signin_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (builder) => SignInPage()),
                (route) => false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/splash.jpg'))
            ),
          )
      ),
    );
  }
}
