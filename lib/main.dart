import 'package:flutter/material.dart';
import 'package:food_app/bottom_nav.dart';
import 'package:food_app/manage_state.dart';
import 'package:food_app/pages/address_page.dart';
import 'package:food_app/pages/deliver_homepage.dart';
import 'package:food_app/sign_up/login_page.dart';
import 'package:food_app/sign_up/phone_page.dart';
import 'package:food_app/sign_up/registration_page.dart';
import 'package:food_app/splash_screen.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ManageState()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PracticeBottomNavBar(),
    );
  }
}