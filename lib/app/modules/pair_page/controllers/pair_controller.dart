import 'dart:async';
import 'dart:convert';
//import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:flutterwebapp_reload_detector/flutterwebapp_reload_detector.dart';
import 'package:get/get.dart';
import 'package:skillmatrix/app/modules/login/views/login_view.dart';
import '../../../routes/app_pages.dart';
//import '../../login/views/login_view.dart';
import 'package:http/http.dart' as http;
//import '../../login/controllers/login_controller.dart';
import '../../../../app_data.dart';


class PairController extends GetxController {
  RxBool isLoading = true.obs;
  late String stringResponse;


  @override
  void onInit() {

    WebAppReloadDetector.onReload(() {
      Get.offAllNamed(Routes.HOME);
    });

    Timer (
      const Duration(seconds: 7),
          () {
           getUserpair();
           isLoading.value = false;
          },
    );
    super.onInit();
  }

  void change() {
    isLoading.value = false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  void getUserpair() async {
    // if(participantLevel == 0) {
    participantLevel++;
    // } else {
    //   participantLevel = participantLevel + 2;
    // }
    var response = await http.post(Uri.parse('https://skillmatrix.azurewebsites.net/pair/$participantLevel') , body: {});
    response = await http.get(Uri.parse('https://skillmatrix.azurewebsites.net/pair/$participantLevel'));
    if (response.statusCode == 200) {
    final json = await jsonDecode(response.body);
      int playerIndex=0;
      for(;playerIndex < json['pair'].length;playerIndex++) {
        if (json['pair'][playerIndex]['player'] == username) {
          break;
        }
      }
      player.value = json['pair'][playerIndex]['player'];
      opponent.value = json['pair'][playerIndex]['opponent'];
      matchId = json['pair'][playerIndex]['match_id'];
      // print(json);
      // print(player.value);
      // print(opponent.value);
      // print(matchId);
      // print(participantLevel);
      //TODO: MAKE A LEVEL VARIABLE
      isLoading.value = false;
      getQuestions();
      Timer(
          const Duration(seconds: 5 ) ,
              () => Get.toNamed(Routes.QUIZPAGE));
      onClose();
    }
    else {
      Get.showSnackbar(const GetSnackBar(
        message: "Could not fetch data",
        duration: Duration(seconds: 5),
      ));
      getQuestions();
      Timer(
          const Duration(seconds: 5 ) ,
              () => Get.toNamed(Routes.QUIZPAGE));
    }
  }

  void getQuestions() async {
    // final response = await http.get(Uri.parse("http://127.0.0.1:8000/questions/$participantLevel"));   //TODO: add level to link
    // if (response.statusCode == 200) {
    //   questionData = json.decode(response.body);
    final response = await rootBundle.loadString('assets/json/questions.json');
   // print(response);
    var responseData = json.decode(response);
  //  print(responseData);
    questionData = responseData['level$participantLevel'];
   // print(questionData);
  //  print(questionData.isEmpty);
      // questionData = [
      //   {
      //     "question_id": "8647d621-f28d-4eaf-858e-672dbb9dcc5d",
      //     "question_text": "what is c stands for",
      //     "choice1": "apple",
      //     "choice2": "ball",
      //     "choice3": "cat",
      //     "choice4": "dog",
      //     "correct_ans": "cat",
      //     "level": 1
      //   } ,
      //   {
      //     "question_id": "8647d621-f28d-4eaf-858e-672dbb9dcc5c",
      //     "question_text": "what is a stands for",
      //     "choice1": "apple",
      //     "choice2": "ball",
      //     "choice3": "cat",
      //     "choice4": "dog",
      //     "correct_ans": "apple",
      //     "level": 1
      //   }
      // ];
      // }
    if(questionData.isEmpty) {
      Get.showSnackbar(const GetSnackBar(
          message: "Could not fetch data",
        ));
    }
    // }
  }
}