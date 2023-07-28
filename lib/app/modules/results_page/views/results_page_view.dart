import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app_data.dart';
//import '../../login/views/login_view.dart';
import '../controllers/results_page_controller.dart';
//import '../../../routes/app_pages.dart';
//import 'package:flutter_svg/svg.dart';

class ResultsPageView extends GetView<ResultsPageController> {
  const ResultsPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Result'),
      // ),
      body:
     // Obx(() =>
      isCompetitionWinner.isFalse
          ? controller.argumentData['winner'][0] == player.value
              ? const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Image(image: AssetImage('assets/images/round_winner.png') , height: 400, width: 400,),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          "You Won this round !!!",
                          style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold , color: Colors.green),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Next round will start in a minute....",
                          style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold , color: Colors.white),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                )
              : const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Image(image: AssetImage('assets/images/loser.png') , height: 300, width: 300,),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Your Opponent Won this round !!!",
                          style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "You will be redirected to the Competitions Page in a minute....",
                          style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold , color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )
          :
      const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Winner, Winner, Quiz Master!!!",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image(image: AssetImage('assets/images/winner.png')),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "You Won this Competition !!!",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold , color: Colors.green),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "You will be redirected to the Competitions Page in a minute....",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold , color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
   // ),
    );
  }
}
