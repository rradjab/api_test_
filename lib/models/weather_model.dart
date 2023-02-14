class CityWeather {
  String? temperature;
  String? feelsLike;
  String? windSpeed;
  String? aboutWeather;
  String? cityName;
  String? icon;
  String? humidity;
  double? windDegree;

  CityWeather(
      {this.temperature,
      this.feelsLike,
      this.windSpeed,
      this.aboutWeather,
      this.cityName,
      this.icon,
      this.humidity,
      this.windDegree});

  factory CityWeather.fromJson(Map<String, dynamic> json) {
    return CityWeather(
      temperature:
          ((json['main']['temp'].toDouble()) - 273.15).toStringAsFixed(0),
      feelsLike:
          ((json['main']['feels_like'].toDouble()) - 273.15).toStringAsFixed(0),
      windSpeed: json['wind']['speed'].toStringAsFixed(0),
      aboutWeather: json['weather'][0]['main'].toString(),
      cityName: json['name'].toString(),
      icon: json['weather'][0]['icon'].toString(),
      humidity: json['main']['humidity'].toString(),
      windDegree: double.parse(json['wind']['deg'].toString()),
    );
  }
}
