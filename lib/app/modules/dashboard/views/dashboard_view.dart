import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/dashboard_controller.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body:
          //Obx(
          // () => controller.isRegistered.isTrue
          //     ? const Center(
          //         child: SizedBox(
          //           height: 200,
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             children: [
          //               Text(
          //                 "Waiting for other participants to join",
          //                 style: TextStyle(
          //                     fontSize: 20,
          //                     fontWeight: FontWeight.bold,
          //                     color: Colors.white),
          //                 textAlign: TextAlign.center,
          //               ),
          //               SizedBox(
          //                 height: 20,
          //               ),
          //               CircularProgressIndicator(),
          //             ],
          //           ),
          //         ),
          //       )
          //     :
          //() =>
          const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Waiting for other participants to join",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 40,
                ),
                CircularProgressIndicator(),
                SizedBox(
                  height: 300,
                ),
                Text(
                  "Please DO NOT hit back or reload the page",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
      // )
    );
  }
}
