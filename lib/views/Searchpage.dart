// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Serves/weather_serves.dart';
import 'package:weather_app/models/weathersmodels.dart';
import 'package:weather_app/proviedr/proviedrhomepage.dart';

// ignore: must_be_immutable
class Searchpage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  Searchpage({this.updateui});
  String? citiyname;
  VoidCallback? updateui;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 213, 111, 15),
        title: const Text('Search a city'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.9,
              child: Image.asset(
                'assets/images/snoww.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                cursorColor: Colors.orange,
                onSubmitted: (data) async {
                  citiyname = data;

                  WeatherServes weatherServer = WeatherServes();

                  Weathersmodels? weath =
                      await weatherServer.getweather(citiyname: citiyname!);
                  Provider.of<Proviedrhomepage>(context, listen: false)
                      .weatherData = weath;
                  Provider.of<Proviedrhomepage>(context, listen: false)
                      .citiyName = citiyname;

                  Navigator.pop(context);
                },
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  label: Text(
                    'Enter a city',
                    style: TextStyle(color: Colors.orange),
                  ),
                  hintText: 'Search a city',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
