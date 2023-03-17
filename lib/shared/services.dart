// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models/weather_model.dart';

class WeatherService {
  Future<WeatherModel> getWeatherData({required String cityName}) async {
    String baseUrl = 'http://api.weatherapi.com/v1';
    String apiKey = 'd9b0a2ff05314496ab3140330230403';
    Uri uri = Uri.parse(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=yes&alerts=yes');
    http.Response response = await http.get(uri);

    Map<String, dynamic> dataRespon = jsonDecode(response.body);



      WeatherModel weatherModel =WeatherModel.fromJson(dataRespon);



    return weatherModel;
  }
}
