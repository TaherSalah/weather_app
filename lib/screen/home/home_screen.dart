import 'package:flutter/material.dart';
import 'package:weather/screen/search/search_screen.dart';
import 'package:weather/shared/widgets/navigator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff101039),
      appBar: AppBar(
        title: const Text('Weather Forecast'),
        actions: [
          IconButton(
              onPressed: () {
                navigate(context, SearchScreen());
              },
              icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.nightlight_outlined)),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xff1a1c49),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      children: const [
                        Text(
                          'Today',
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'cairo',
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          'set, 3 Mar',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'cairo',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      children: [
                        const Text(
                          '30',
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'cairo',
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'o',
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'cairo',
                              fontWeight: FontWeight.bold,
                              color: Color(0xffF8A01A)),
                        ),
                        const Text(
                          'C',
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'cairo',
                              fontWeight: FontWeight.bold,
                              color: Color(0xffF8A01A)),
                        ),
                        const Spacer(),
                        Image.asset(
                          'assets/images/clear.png',
                          height: 100,
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      children: [
                        Image.asset('assets/images/location.png'),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Cairo, Al Qahirah. Egypt',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'cairo',
                              color: Color(0xffABB0C4)),
                        ),
                      ],
                    ),
                  ),
              const    SizedBox(height: 15,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
