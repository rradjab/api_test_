import 'package:api_test_/models/weather_model.dart';
import 'package:api_test_/widgets/weather_view.dart';
import 'package:flutter/material.dart';

import '../api/api.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Weather> {
  late Future<CityWeather> _cityWeather;
  List<String> cities = ['Baku', 'Kyiv', 'Moscow', 'London'];
  String selectedCity = 'Baku';

  @override
  void initState() {
    super.initState();
    _cityWeather = getWeather(selectedCity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Country"),
        actions: [
          DropdownButton<String>(
            value: selectedCity,
            onChanged: (newValue) {
              setState(() {
                debugPrint(newValue);
                selectedCity = newValue.toString();
                _cityWeather = getWeather(selectedCity);
              });
            },
            items: cities.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
      body: FutureBuilder(
        future: _cityWeather,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            CityWeather cw = snapshot.data!;
            debugPrint(cw.aboutWeather);
            return WeatherView(
              cityWeather: cw,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Səhv: ${snapshot.error.toString()}"),
            );
          }
          return const CircularProgressIndicator();
        }),
      ),
    );
  }
}
