import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animations/loading_animations.dart';
import '../../../routes/app_pages.dart';
import '../controllers/dashboard_controller.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:loading_indicator/loading_indicator.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Center(child: Text('Waiting For other participants to join',style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Colors.white),)),
      // ),
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

      Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage("assets/images/Knockout.jpg"),
            fit: BoxFit.fill,
            alignment: Alignment.center,
          ),
        ),
        child: ClipRRect( // make sure we apply clip it properly
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0, sigmaY: 4),
            child: Container(
              alignment: Alignment.center,
              color: Colors.grey.withOpacity(0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Waiting for other participants to join",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  const SizedBox(
                    height: 200,
                    child: LoadingIndicator(
                      indicatorType: Indicator.ballClipRotateMultiple,
                      colors: [Colors.white],
                      strokeWidth: 4.0,
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Obx(() => Text("Please Wait ${controller.current} seconds",
                      style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))),

                ],
              ),
            ),
          ),
        ),
      )

        // child: Column(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Text(
        //           "Waiting for other participants to join",
        //           style: TextStyle(
        //               fontSize: 20,
        //               fontWeight: FontWeight.bold,
        //               color: Colors.white),
        //           textAlign: TextAlign.center,
        //         ),
        //         SizedBox(
        //           height: 40,
        //         ),
        //         CircularProgressIndicator(),
        //         SizedBox(
        //           height: 300,
        //         ),
        //         Text(
        //           "Please DO NOT hit back or reload the page",
        //           style: TextStyle(
        //               fontSize: 20,
        //               fontWeight: FontWeight.bold,
        //               color: Colors.white),
        //           textAlign: TextAlign.center,
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
      );
      // )
   // );
  }
}

