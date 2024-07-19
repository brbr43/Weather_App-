import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore: unused_import
import 'package:weather_app/models/weathersmodels.dart';
import 'package:weather_app/proviedr/proviedrhomepage.dart';
import 'package:weather_app/views/Searchpage.dart';
// ignore: unused_import
import 'package:weather_app/widgets/no_weather_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

Weathersmodels? weatherData;

class _HomeViewState extends State<HomeView> {
  void updateui() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    weatherData =
        Provider.of<Proviedrhomepage>(context, listen: true).weatherData;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Searchpage(
                    updateui: updateui,
                  );
                }));
              },
              icon: const Icon(Icons.search),
              color: Colors.white,
            ),
          )
        ],
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Opacity(
              opacity: 0.9,
              child: Image.asset(
                'assets/images/snoww.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          weatherData == null
              ? const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 70),
                          child: Text(
                            'There is no weather data Right now ',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Text(
                          ' Go to Search and start 🔍',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : Stack(
                  children: [
                    Positioned.fill(
                      child: Opacity(
                        opacity: 0.9,
                        child: Image.asset(
                          weatherData!.getimagbackground(),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 300),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Spacer(
                              flex: 80,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(
                                Provider.of<Proviedrhomepage>(context,
                                        listen: false)
                                    .citiyName!,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 27),
                              ),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(
                                'Last update: ${weatherData!.date}',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(weatherData!.getimag()),
                                Text(
                                  'Tempavg: ${weatherData!.avgtemp.toInt()}',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Max temp: ${weatherData!.maxtemp.toInt()}',
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 10),
                                    ),
                                    Text(
                                      'Min temp: ${weatherData!.mintemp.toInt()}',
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 10),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(
                                weatherData?.weatherstatename ?? 'No data',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 27),
                              ),
                            ),
                            const Spacer(
                              flex: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
