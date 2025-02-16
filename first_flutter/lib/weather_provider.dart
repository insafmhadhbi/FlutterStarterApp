import 'package:flutter/material.dart';
import 'package:first_flutter/models/weather_data.dart';

class WeatherProvider extends InheritedNotifier<ValueNotifier<WeatherData?>> {
  WeatherProvider({
    Key? key,
    required ValueNotifier<WeatherData?> notifier,
    required Widget child,
  }) : super(key: key, notifier: notifier, child: child);

  static WeatherProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<WeatherProvider>();
  }

  @override
  bool updateShouldNotify(WeatherProvider oldWidget) {
    return notifier != oldWidget.notifier; 
  
  }
}
