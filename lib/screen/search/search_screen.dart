import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/models/provider/weather_provider.dart';
import 'package:weather/shared/services.dart';

import '../../shared/widgets/custom_form_fiald.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key, this.upDateUi}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
  String? cityName;
  VoidCallback? upDateUi;
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    WeatherService weatherService = WeatherService();
    String? dataValue;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Search with city'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Please enter your city name ',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.lightGreenAccent, fontSize: 20)),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomFormField(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              lable: const Text('search'),
              hint: 'Search With City',
              onChanged: (value) async {},
              onSubmitted: (value) async {
                // ignore: avoid_print
                widget.cityName = value;
                WeatherModel weatherModel = await weatherService.getWeatherData(
                    cityName: widget.cityName ?? 'city name is not found');
                // ignore: avoid_print
                print('data $weatherModel');
                // ignore: use_build_context_synchronously
                Provider.of<WeatherProvider>(context, listen: false)
                    .weatherDataProvider = weatherModel;
                Provider.of<WeatherProvider>(context, listen: false).cityName =
                    widget.cityName;

                Navigator.pop(context);
              },
              controller: TextEditingController(),
              icon: const Icon(Icons.search),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
