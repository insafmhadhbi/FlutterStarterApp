import 'package:flutter/material.dart';
import 'package:first_flutter/pages/weather.detail.page.dart';
class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  String city = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(city.isEmpty ? 'Weather App' : city),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Enter city name'),
              onChanged: (text) {
                setState(() {
                  city = text;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (city.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WeatherDetails(city),
                    ),
                  );
                }
              },
              child: Text('Get Weather...'),
            ),
          ],
        ),
      ),
    );
  }
}
