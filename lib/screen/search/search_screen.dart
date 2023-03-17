import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/shared/services.dart';

import '../../shared/widgets/custom_form_fiald.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
  String? cityName;
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    WeatherService weatherService = WeatherService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search with city'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomFormField(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              lable: const Text('search'),
              hint: 'Search With City',
              onChanged: (value) {},
              onSubmitted: (value) async{
                // ignore: avoid_print
                widget.cityName = value;
           WeatherModel weatherModel=   await  weatherService.getWeatherData(cityName: widget.cityName!);

                print('data $weatherModel');
              },
              controller: TextEditingController(),
              icon: const Icon(Icons.search),
            ),
          ),
          const SizedBox(
            height: 5,
          ),

          // defaultButton(context: context, name: 'Search', onPressed: () {}),
        ],
      ),
    );
  }
}
