import 'package:flutter/material.dart';
import 'package:weather_app/models/weathersmodels.dart';

class Proviedrhomepage extends ChangeNotifier {
  Weathersmodels? _weatherData;

  String? citiyName;
  set weatherData(Weathersmodels? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  Weathersmodels? get weatherData => _weatherData;
}
