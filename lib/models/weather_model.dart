class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});

  /////// factory construtor  بترجع ليا obj من نفس الوديل الي عامله قروم جيسون بحيث بيكون طالب مني احط الداتا بشكل مهم وانا كدا مئ هاغير فيها /////

  factory WeatherModel.fromJson(dynamic jsonData) {
/////////////////////////// كدا انا عملت named constractor  علشان ابني obj من الداتا الي جايه لي من api //////////////////
    var data = jsonData['forecast']['forecastday'][0]['day'];
    print(data);

    return WeatherModel(
        date: jsonData['location']['localtime'],
        temp: data['avgtemp_c'],
        maxTemp: data['maxtemp_c'],
        minTemp: data['mintemp_c'],
        weatherStateName: data['condition']['text']);





  }

  @override
  String toString() {
    return 'date is $date temp is $temp maxTemp is $maxTemp minTemp is $minTemp state is $weatherStateName';
  }
}
