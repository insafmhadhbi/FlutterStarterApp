// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:first_flutter/pages/other.dart'; // Ensure this file exists
// // import 'package:first_flutter/controllers/counter_controller.dart';

// // class CounterPage extends StatelessWidget {
// //   final CounterController controller = Get.find(); // Get the globally available controller

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Obx(() => Text('Count: ${controller.count}')), // Reactive title
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Obx(() => Text(
// //                   'Current Count: ${controller.count}',
// //                   style: TextStyle(fontSize: 24),
// //                 )),
// //             SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: controller.increment, // Increment count
// //               child: Text('Increment Count'),
// //             ),
// //             SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: () => Get.to(() => Other()), // Navigate to Other page
// //               child: Text('Go to Other Page'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:first_flutter/pages/other.dart';
// import 'package:first_flutter/controllers/counter_controller.dart';

// class CounterPage extends StatelessWidget {
//   final CounterController controller = Get.find(); // Use the globally available controller

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Counter Page'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 Get.to(() => Other()); // Navigate to Other page
//               },
//               child: Text('Go to Other Page'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: controller.increment, // Increment count
//               child: Text('Increment Count'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:first_flutter/pages/other.dart';
import 'package:first_flutter/controllers/counter_controller.dart';

class CounterPage extends StatelessWidget {
  final CounterController controller =
      Get.find(); // Use the globally available controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => Other()); // Navigate to Other page
          },
          child: Text('Go to Other Page'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment, // Increment count
        child: Icon(Icons.add),
        tooltip: 'Increment Count',
      ),
    );
  }
}
