import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/models/provider/weather_provider.dart';
import 'package:weather/screen/home/home_screen.dart';
import 'package:weather/screen/welcome/welcom_screen.dart';
import 'package:weather/shared/services.dart';

main() async {
  runApp(ChangeNotifierProvider(
    create: (context) => WeatherProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       primarySwatch: Provider.of<WeatherProvider>(context).weatherDataProvider==null? Colors.blueGrey : Provider.of<WeatherProvider>(context).weatherDataProvider!.changeThemeColor(),
      ),
      home:  HomeScreen(),
    );
  }
}
