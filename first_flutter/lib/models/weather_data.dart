class WeatherData {
  final String town;
  final DateTime date;
  final double temperature;
  final String weatherDescription;

  WeatherData({
    required this.town,
    required this.date,
    required this.temperature,
    required this.weatherDescription,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    String town = json['name'];
    DateTime date = DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000);
    double temperature = json['main']['temp'] - 273.15;
    String weatherDescription = json['weather'][0]['main'];

    return WeatherData(
      town: town,
      date: date,
      temperature: temperature,
      weatherDescription: weatherDescription,
    );
  }
}
