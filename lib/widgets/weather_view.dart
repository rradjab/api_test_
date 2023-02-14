import 'package:flutter/material.dart';
import 'package:api_test_/models/weather_model.dart';

class WeatherView extends StatelessWidget {
  final CityWeather cityWeather;
  const WeatherView({super.key, required this.cityWeather});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 70.0,
            backgroundImage: NetworkImage(
                'http://openweathermap.org/img/w/${cityWeather.icon}.png'),
            backgroundColor: Colors.transparent,
          ),
          Text(
            cityWeather.cityName.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0),
          ),
          Text(
            '${cityWeather.temperature}°C (Real Feel ${cityWeather.feelsLike}°C)',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
          ),
          Text(
            'Wind Speed: ${cityWeather.windSpeed} km/h',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
          ),
          Text(
            'Weather: ${cityWeather.aboutWeather}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
          ),
          Text(
            'Humidity: ${cityWeather.humidity}%',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
          ),
          Transform.rotate(
              angle: cityWeather
                  .windDegree!, //change this value to rotate the child
              child: const Icon(size: 50.0, Icons.navigation)),
        ],
      ),
    );
  }
}
