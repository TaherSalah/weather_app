import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  String name;
  String region;
  String country;
  String tz_id;
  DateTime last_updated;
  double temp;
  double maxTemp;
  double minTemp;
  double feelslike_c;
  double pressure_mb;
  double wind_kph;

  // double dewpoint_c;
  String weatherStateName;

  WeatherModel({required this.date,
    required this.name,
    required this.region,
    required this.country,
    required this.tz_id,
    required this.last_updated,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.feelslike_c,
    required this.pressure_mb,
    required this.wind_kph,
    // required this.dewpoint_c,
    required this.weatherStateName});

  /////// factory construtor  بترجع ليا obj من نفس الوديل الي عامله قروم جيسون بحيث بيكون طالب مني احط الداتا بشكل مهم وانا كدا مئ هاغير فيها /////

  factory WeatherModel.fromJson(dynamic jsonData) {
/////////////////////////// كدا انا عملت named constractor  علشان ابني obj من الداتا الي جايه لي من api //////////////////
    var data = jsonData['forecast']['forecastday'][0]['day'];
    // var dataR = jsonData['forecast']['forecastday'][0]['day']['astro']['hour'][0];
    var current = jsonData['current'];
    print(data);

    return WeatherModel(
        date: DateTime.parse(jsonData['location']['localtime']),
        name: jsonData['location']['name'],
        region: jsonData['location']['region'],
        country: jsonData['location']['country'],
        tz_id: jsonData['location']['tz_id'],
        last_updated: DateTime.parse(current['last_updated']),
        temp: data['avgtemp_c'],
        maxTemp: data['maxtemp_c'],
        minTemp: data['mintemp_c'],
        feelslike_c: current['feelslike_c'],
        pressure_mb: current['pressure_mb'],
        wind_kph: current['wind_kph'],
        // dewpoint_c: dataR['time_epoch']['dewpoint_c'],
        weatherStateName: data['condition']['text']);
  }

  // @override
  // String toString() {
  //   return 'date is $date temp is $temp maxTemp is $maxTemp minTemp is $minTemp state is $weatherStateName';
  // }

  MaterialColor? changeThemeColor() {
    if (weatherStateName == 'Clear' ||
        weatherStateName == 'Sunny' ||
        weatherStateName == 'Patchy light drizzle') {
      return Colors.orange;
    } else if (weatherStateName == 'Light sleet' ||
        weatherStateName == 'Light snow' ||
        weatherStateName == 'Blowing snow') {
      return Colors.blue;
    } else if (weatherStateName == 'Cloudy' ||
        weatherStateName == 'Partly cloudy') {
      return Colors.blueGrey;

    } else if (weatherStateName == 'Light rain shower') {
      return Colors.blue;

    } else if (weatherStateName == 'Moderate or heavy rain shower' ||
        weatherStateName == 'Torrential rain shower' ||
        weatherStateName == 'Light sleet showers' ||
        weatherStateName == 'Thundery outbreaks in nearby' ||
        weatherStateName == 'Patchy light rain in area with thunder') {
      return Colors.blue;
    } else {
      return Colors.orange;
    }
  }
  String? getImage() {
    if (weatherStateName == 'Clear' ||
        weatherStateName == 'Sunny' ||
        weatherStateName == 'Patchy light drizzle') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Light sleet' ||
        weatherStateName == 'Light snow' ||
        weatherStateName == 'Blowing snow') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Cloudy' ||
        weatherStateName == 'Partly cloudy') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Light rain shower') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Moderate or heavy rain shower' ||
        weatherStateName == 'Torrential rain shower' ||
        weatherStateName == 'Light sleet showers' ||
        weatherStateName == 'Thundery outbreaks in nearby' ||
        weatherStateName == 'Patchy light rain in area with thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }
}
