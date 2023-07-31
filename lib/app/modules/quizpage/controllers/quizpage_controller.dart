import 'dart:async';
import 'dart:convert';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterwebapp_reload_detector/flutterwebapp_reload_detector.dart';
import 'package:get/get.dart';
//import 'package:skillmatrix/app/modules/login/views/login_view.dart';
import 'package:skillmatrix/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;
import '../../../../app_data.dart';
import 'package:quiver/async.dart';

class QuizpageController extends GetxController {
  late PageController pageController;
  int currentPageIndex = 0;
  RxBool isFinalQuestion = false.obs;
  RxBool isLoading = false.obs;
  RxBool isOptionSelected = false.obs;
  RxBool isAnswerCorrect = false.obs;
  RxBool isTimeOver = false.obs;
  int start = 30;
  RxInt current = 30.obs;
 // late String stringResponse;

  @override
  Future<void> onInit() async {
    WebAppReloadDetector.onReload(() {
      Get.toNamed(Routes.HOME);
    });
    super.onInit();
    //isLoading.value = true;
    pageController = PageController();
    pageController.addListener(() {
      isFinalQuestion.value = !(currentPageIndex < questionData.length - 1);
    });

    //selectedOptions = List<String>.filled(questionData.length, '');
    //print(questionData.length);
    isLoading.value = false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    pageController.removeListener(() {});
    pageController.dispose();
    super.onClose();
  }

  void nextQuestion() async {
   // print("hellllllllllllo");
  // print("currentPageIndex: $currentPageIndex  questionData.length: ${questionData.length}");
    currentPageIndex++;
    pageController.addListener(() {
      isFinalQuestion.value = !(currentPageIndex < questionData.length -1 );
    });
   //print("currentPageIndex: $currentPageIndex  questionData.length: ${questionData.length}");
    if (currentPageIndex < questionData.length  ) {
   // print("if mein hun");
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    else if (currentPageIndex == questionData.length ) {
      // Get.toNamed(Routes.RESULTS_PAGE);
   //print("else mein hun");
      await getResults();
    }
  }

  Future<void> getResults() async {

    // var request = await http.MultipartRequest(
    //     'POST', Uri.parse('http://127.0.0.1:8000/score/$participantId'));
    // request.fields.addAll({'score': score.toString()});
    // http.StreamedResponse response = await request.send();
    //stringResponse = await response.stream.bytesToString();
   // print( "yaha pe hun");
    var request = await http.put(
      Uri.parse('https://skillmatrix.onrender.com/score/$participantId') ,
      body: {
        "Score": score.toStringAsFixed(8),      //TODO: change the pre defined results
      },
    );
   //  print(participantId);
   //  print(request.statusCode);
   //  print("sdasdasd");
   // print(json.decode(request.body));
   //  print("sdasdasd");
    if (request.statusCode == 201) {
      Timer(const Duration(seconds: 30), () async {
        final response = await http.post(Uri.parse("https://skillmatrix.onrender.com/winner/$matchId"),
            body: {}
        );

     // print("matchid$matchId");
      Timer(const Duration(seconds: 30), () async {
        final response = await http.get(Uri.parse("https://skillmatrix.onrender.com/winner/show/$matchId"));
      //  print(response.body);
        var responseData = json.decode(response.body);
        final levelResponse = await http.post(Uri.parse("https://skillmatrix.onrender.com/levels/$competitionId/${participantLevel + 1}") , body: {});
        var levelResponseData = json.decode(levelResponse.body);
        if(response.statusCode == 201) {
          if (responseData['username'] == username) {
            // print(levelResponseData['total_level']);
            // print(participantLevel);
            if (levelResponseData['next_level'] == false) {
              isCompetitionWinner.value = true;
              // print("1111111111");
              // print(isCompetitionWinner.value);
              Get.toNamed(Routes.RESULTS_PAGE, arguments: {
                'winner': [responseData['username']],
              });
            }
            else {
            //  print("2222222222");
              Get.toNamed(Routes.RESULTS_PAGE, arguments: {
                'winner': [responseData['username']],
              });
            }
          }
          else{
          //  print("333333333333");
            Get.toNamed(Routes.RESULTS_PAGE, arguments: {
              'winner': [responseData['username']],
            });
          }
        }
      });
      });
    } else {
      if (request.body.contains('non_field_errors')) {
        Get.showSnackbar(const GetSnackBar(
          message: "Invalid Credentials",
        ));
      } else {
        Get.showSnackbar(const GetSnackBar(
          duration: Duration(seconds: 2),
          message: "No participant found for corresponding id !!!",
        ));
      }
    }


    // isCompetitionWinner.value = false;
    //   Get.toNamed(Routes.RESULTS_PAGE, arguments: {
    //     'winner': player.value,
    //   });
      
  }

  bool calcScore(int index, String selectedOption, DateTime dateTime) {
    if (selectedOption == questionData[index]["correct_ans"]) {
      DateTime dateTimeAfterEnd = DateTime.now();
      var difference1 = dateTimeAfterEnd.difference(dateTime);
      int difference2 = difference1.inSeconds + (dateTimeAfterEnd.millisecond - dateTime.millisecond).abs();

     // print("````${difference2}");
      score += 1 / difference2;
    //  print(score);
      return true;
    } else {
      // print(score);
      return false;
    }
  }

  void startTimer() {
    CountdownTimer countDownTimer = CountdownTimer(
      Duration(seconds: start),
      const Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      current.value = start - duration.elapsed.inSeconds;
    });

    sub.onDone(() {
      isTimeOver.value = true;
      isOptionSelected.value = false;
      isAnswerCorrect.value = false;
      current.value = 30;
      sub.cancel();
    });
  }
}
