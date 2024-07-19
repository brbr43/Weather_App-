// ignore: unused_import
import 'package:flutter/foundation.dart';
// ignore: unused_import
import 'package:flutter/material.dart';

class Weathersmodels {
  String date;
  double avgtemp;
  double maxtemp;
  double mintemp;
  String weatherstatename;

  Weathersmodels(
      {required this.date,
      required this.avgtemp,
      required this.maxtemp,
      required this.mintemp,
      required this.weatherstatename});

  factory Weathersmodels.fromjason(dynamic data) {
    return Weathersmodels(
        date: data['current']['last_updated'],
        avgtemp: data['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxtemp: data['forecast']['forecastday'][0]['day']['maxtemp_c'],
        mintemp: data['forecast']['forecastday'][0]['day']['mintemp_c'],
        weatherstatename: data['forecast']['forecastday'][0]['day']['condition']
            ['text']);
  }
  @override
  String toString() {
    return 'date=$date avgtemp=$avgtemp';
  }

  String getimag() {
    switch (weatherstatename) {
      case 'Clear':
      case 'Sunny':
        return 'assets/images/clear.png';
      case 'thunderstorm':
      case 'thunder':
        return 'assets/images/thunderstorm.png';
      case 'Sleet':
      case 'Snow':
      case 'Overcast':
        return 'assets/images/snow.png';
      case 'Heavy Rain':
      case 'Light Rain':
      case 'Patchy rain nearby':
      case 'Moderate rain':
        return 'assets/images/rainy.png';
      case 'Heavy cloud':
      case 'Light cloud':
      case 'Partly Cloudy':
        return 'assets/images/cloudy.png';
      default:
        return 'assets/images/clear.png';
    }
  }

  // ignore: non_constant_identifier_names
  MaterialColor Getcolor() {
    switch (weatherstatename) {
      case 'Clear':
      case 'Sunny':
      case 'Light Cloud':
        return Colors.orange;
      case 'thunderstorm':
      case 'thunder':
        return Colors.cyan;
      case 'Sleet':
      case 'Snow':
      case 'Overcast':
        return Colors.lightBlue;
      case 'Heavy Rain':
      case 'Light Rain':
      case 'Patchy rain nearby':
      case 'Moderate rain':
        return Colors.blue;
      case 'Heavy cloud':
      case 'Light cloud':
        return Colors.grey;
      default:
        return Colors.orange;
    }
  }

  String getimagbackground() {
    switch (weatherstatename) {
      case 'Clear':
      case 'Sunny':
        return 'assets/imagebackground/Sun.jpg';
      case 'thunderstorm':
      case 'thunder':
        return 'assets/imagebackground/thunder.jpg';
      case 'Sleet':
      case 'Snow':
      case 'Overcast':
        return 'assets/imagebackground/Snow.jpg';
      case 'Heavy Rain':
      case 'Light Rain':
      case 'Patchy rain nearby':
      case 'Moderate rain':
        return 'assets/imagebackground/rain.jpg';
      case 'Heavy cloud':
      case 'Light cloud':
      case 'Partly Cloudy':
        return 'assets/imagebackground/Sun.jpg';

      default:
        return 'assets/imagebackground/Sun.jpg';
    }
  }
}
