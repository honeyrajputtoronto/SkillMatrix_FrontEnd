import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillmatrix/app/routes/app_pages.dart';

class QuizpageController extends GetxController {
  late PageController pageController;
  int currentPageIndex = 0;
  RxBool isFinalQuestion = false.obs;
  RxBool isLoading = false.obs;
  late QuerySnapshot<Map<String, dynamic>> data;
  DateTime dateTime = DateTime.now();

  List<String> selectedOptions = [];
  @override
  Future<void> onInit() async {
    super.onInit();
    isLoading.value = true;
    data = await FirebaseFirestore.instance
        .collection('quiz')
        .where('quiz_type', isEqualTo: 'easy')
        .get();
    pageController = PageController();
    pageController.addListener(() {
      isFinalQuestion.value = !(currentPageIndex < data.size - 1);
    });

    selectedOptions = List<String>.filled(data.size, '');
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

  void nextQuestion() {
    dateTime.difference(DateTime.now());
    if (currentPageIndex < data.docs.length - 1) {
      currentPageIndex++;
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousQuestion() {
    if (currentPageIndex > 0) {
      currentPageIndex--;
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void selectOption(String option) {
    selectedOptions[currentPageIndex] = option;
  }

  void submitAnswer() {
    Get.toNamed(Routes.RESULTS_PAGE);
  }
}
