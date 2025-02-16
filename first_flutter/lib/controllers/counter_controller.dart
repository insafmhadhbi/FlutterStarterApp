import 'package:get/get.dart';

class CounterController extends GetxController {
  var count = 0.obs; // Reactive variable

  void increment() {
    count++; // Increment the count
  }
}
