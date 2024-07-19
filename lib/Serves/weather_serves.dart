// ignore: unused_import
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weathersmodels.dart';

class WeatherServes {
  String baseurl = 'http://api.weatherapi.com/v1';
  String apikey = '5b58d6aba86a4ecba1f100613241707';
  Future<Weathersmodels> getweather({required String citiyname}) async {
    Uri url =
        Uri.parse('$baseurl/forecast.json?key=$apikey&q=$citiyname&days=7');

    http.Response response;
    response = await http.get(url);
    // ignore: unused_local_variable
    Map<String, dynamic> data = jsonDecode(response.body);
    // ignore: unused_local_variable
    Weathersmodels weather = Weathersmodels.fromjason(data);

    return weather;
  }
}
