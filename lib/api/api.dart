import 'package:dio/dio.dart';

import '../models/weather_model.dart';

Future<CityWeather> getWeather(String city) async {
  String url =
      'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=10530cd042fdda8d65051ca864fc86bf';
  var response = await Dio().get(url);

  if (response.statusCode == 200) {
    return CityWeather.fromJson(response.data);
  }
  return CityWeather();
}
