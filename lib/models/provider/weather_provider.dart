import 'package:flutter/cupertino.dart';
import 'package:weather/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherModel;
String? cityName;
  set weatherDataProvider(WeatherModel? weather) {
    _weatherModel = weather;
    notifyListeners();
  }

  WeatherModel? get weatherDataProvider => _weatherModel;
}
