import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart'; // Required for Firebase initialization
import 'package:first_flutter/pages/HomePage.dart'; // Ensure the path is correct
import 'package:first_flutter/controllers/counter_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures proper initialization
  await Firebase.initializeApp(); // Initializes Firebase
  Get.put(CounterController()); // Register the controller globally
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Navigation Drawer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(), // Start with HomePage
    );
  }
}
