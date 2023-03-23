import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/models/provider/weather_provider.dart';
import 'package:weather/screen/search/search_screen.dart';
import 'package:weather/shared/widgets/navigator.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void upDateUi() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var providerData =
        Provider.of<WeatherProvider>(context).weatherDataProvider;
    return Scaffold(
      backgroundColor:  Colors.transparent,
      appBar: AppBar(
        title: const Text('Weather Forecast'),
        actions: [
          IconButton(
              onPressed: () {
                navigate(context, SearchScreen());
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      body: providerData != null
          ? SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 60,
                  ),
                  const Text(
                    'Welcome Back 😎',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.green,
                        letterSpacing: 4,
                        fontFamily: 'run',
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 75, vertical: 15),
                      child: Row(
                        children: [
                          Image.asset('assets/images/location.png'),
                          const SizedBox(
                            width: 7,
                          ),
                          Expanded(
                            child: Text(
                              '${providerData.name}, ${providerData.region}. ${providerData.country}',
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'cairo',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffABB0C4)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    ' ${providerData.tz_id}',
                    style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'cairo',
                        fontWeight: FontWeight.bold,
                        color: Color(0xff47C68F)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                providerData.changeThemeColor()!,
                                providerData.changeThemeColor()![200]!,
                                providerData.changeThemeColor()![300]!,
                              ])),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              children: [
                                const Text(
                                  'Today',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'cairo',
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Text(
                                  '${providerData.date.day.toString()}-${providerData.date.month.toString()}-${providerData.date.year.toString()}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'cairo',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              children: [
                                const Text(
                                  'Updated Time',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: 'cairo',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                Spacer(),
                                Text(
                                  '${providerData.date.hour.toString()}:${providerData.date.minute.toString()}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'cairo',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              children: [
                                Text(
                                  '${providerData.temp.toInt()}',
                                  style: const TextStyle(
                                      fontSize: 45,
                                      fontFamily: 'cairo',
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'ْ ',
                                  style: TextStyle(
                                      fontSize: 60,
                                      fontFamily: 'cairo',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                const Text(
                                  'C',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'cairo',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                const Spacer(),
                                Image.asset(
                                  providerData.getImage()!,
                                  height: 100,
                                  width: 100,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            providerData.weatherStateName,
                            style: const TextStyle(
                                fontSize: 30,
                                fontFamily: 'cairo',
                                fontWeight: FontWeight.bold,
                                color: Color(0xffffffff)),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                providerData.changeThemeColor()!,
                                providerData.changeThemeColor()![200]!,
                                providerData.changeThemeColor()![300]!,
                              ])),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              children: [
                                const Text(
                                  'Min Temp',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: 'cairo',
                                      fontWeight: FontWeight.w800,
                                      color: CupertinoColors.systemIndigo),
                                ),
                                Spacer(),
                                Text(
                                  '${providerData.minTemp.toInt()}',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'cairo',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              children: [
                                const Text(
                                  'Max Temp',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: 'cairo',
                                      fontWeight: FontWeight.w800,
                                      color: CupertinoColors.systemIndigo),
                                ),
                                const Spacer(),
                                Text(
                                  '${providerData.maxTemp.toInt()}',
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'cairo',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              children: [
                                const Text(
                                  'feels like',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: 'cairo',
                                      fontWeight: FontWeight.w800,
                                      color: CupertinoColors.systemIndigo),
                                ),
                                const Spacer(),
                                Text(
                                  '${providerData.feelslike_c.toInt()}',
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'cairo',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              children: [
                                const Text(
                                  'pressure mb',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: 'cairo',
                                      fontWeight: FontWeight.w800,
                                      color: CupertinoColors.systemIndigo),
                                ),
                                const Spacer(),
                                Text(
                                  '${providerData.pressure_mb.toInt()}',
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'cairo',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    textAlign: TextAlign.center,
                    'There is no weather start searching  now 🔍',
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'cairo',
                        fontWeight: FontWeight.w500,
                        color: Color(0xfff8A01A)),
                  ),
                ],
              ),
            ),
    );
  }
}
