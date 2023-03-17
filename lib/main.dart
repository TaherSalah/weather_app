import 'package:flutter/material.dart';
import 'package:weather/screen/home/home_screen.dart';
import 'package:weather/screen/welcome/welcom_screen.dart';
import 'package:weather/shared/services.dart';

main() async {
  runApp(const MyApp());
// ignore: avoid_print
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const WelcomeScreen(),
    );
  }
}
