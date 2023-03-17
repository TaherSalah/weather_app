import 'package:flutter/material.dart';
import 'package:weather/screen/home/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff26275b),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
              child: Image.asset(
            'assets/images/cloudy.png',
            height: 250,
            width: 250,
          )),

          // ignore: prefer_const_constructors
          Text.rich(
            const TextSpan(
                text: 'Weather App ',
                style: TextStyle(
                    fontFamily: 'cairo',
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                      text: 'News',
                      style: TextStyle(
                          color: Color(0xffF8A01A),
                          fontSize: 30,
                          fontFamily: 'cairo',
                          fontWeight: FontWeight.bold)),
                ]),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),

          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              textAlign: TextAlign.center,
              'This app Provides information about temperature, humidity, wind speed, wind direction, precipitation and other weather conditions',
              style: TextStyle(
                  fontFamily: 'cairo', fontSize: 18, color: Color(0xffABB0C4)),
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
          ElevatedButton(
            style: ButtonStyle(
                elevation: const MaterialStatePropertyAll(5),
                backgroundColor:
                    const MaterialStatePropertyAll(Color(0xffFFD059)),
                textStyle:
                    MaterialStateProperty.all(const TextStyle(fontSize: 20)),
                padding: const MaterialStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 17, horizontal: 85),
                )),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ));
            },
            child: const Text(
              'Get Started',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'cairo',
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
