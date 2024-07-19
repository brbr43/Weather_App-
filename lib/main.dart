import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:weather_app/models/weathersmodels.dart';
import 'package:weather_app/proviedr/proviedrhomepage.dart';
import 'package:weather_app/views/home_view.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) {
        return Proviedrhomepage();
      },
      child: WeatherApp()));
}

// ignore: use_key_in_widget_constructors
class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Provider.of<Proviedrhomepage>(context, listen: false)
                      .weatherData ==
                  null
              ? Colors.blue
              : Provider.of<Proviedrhomepage>(context, listen: false)
                  .weatherData!
                  .Getcolor()),
      // ignore: prefer_const_constructors
      home: HomeView(),
    );
  }
}
