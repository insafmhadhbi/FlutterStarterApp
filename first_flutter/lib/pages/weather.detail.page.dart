import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WeatherDetails extends StatefulWidget {
  final String city;

  WeatherDetails(this.city);

  @override
  _WeatherDetailsState createState() => _WeatherDetailsState();
}

class _WeatherDetailsState extends State<WeatherDetails> {
  Map<String, dynamic>? weatherData;
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    getData(widget.city);
  }

  Future<void> getData(String city) async {
    String apiKey = 'fc82c9d17eebe931a3b58219347f5997'; // Replace with your actual API key
    String url = "https://api.openweathermap.org/data/2.5/forecast?q=$city,tn&APPID=$apiKey";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        setState(() {
          weatherData = json.decode(response.body);
          isLoading = false;
          hasError = false;
        });
      } else {
        setState(() {
          isLoading = false;
          hasError = true;
        });
      }
    } catch (error) {
      setState(() {
        isLoading = false;
        hasError = true;
      });
      print("Error: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.city),
        backgroundColor: const Color.fromARGB(255, 94, 76, 175),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : hasError
              ? Center(child: Text("Failed to load weather data. Please try again."))
              : ListView.builder(
                  itemCount: weatherData!['list'].length,
                  itemBuilder: (context, index) {
                    var item = weatherData!['list'][index];
                    DateTime date = DateTime.fromMillisecondsSinceEpoch(item['dt'] * 1000);
                    double temperature = item['main']['temp'] - 273.15;
                    String weatherDescription = item['weather'][0]['main'];
                    String iconCode = item['weather'][0]['icon'];

                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://openweathermap.org/img/wn/$iconCode@2x.png',
                        ),
                      ),
                      title: Text(
                        DateFormat('E dd/MM/yyyy').format(date),
                      ),
                      subtitle: Text('${temperature.toStringAsFixed(1)}°C - $weatherDescription'),
                    );
                  },
                ),
    );
  }
}
