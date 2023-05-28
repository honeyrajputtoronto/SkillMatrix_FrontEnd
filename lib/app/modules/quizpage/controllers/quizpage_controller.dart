import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillmatrix/app/routes/app_pages.dart';

class QuizpageController extends GetxController {
  late PageController pageController;
  int _currentPageIndex = 0;
  RxBool isFinalQuestion = false.obs;
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What is Flutter known for?',
      'options': ['Cross-platform mobile development', 'Web development', 'Game development', 'Machine learning'],
      'correctAnswer': 0,
    },
    {
      'question': 'What programming language is used in Flutter?',
      'options': ['Java', 'Swift', 'Dart', 'C#'],
      'correctAnswer': 2,
    },
    {
      'question': 'What is the widget tree in Flutter?',
      'options': ['A hierarchical structure of user interface elements', 'A data structure for managing network requests', 'A database for storing app data', 'A collection of code snippets for reusability'],
      'correctAnswer': 0,
    },
    {
      'question': 'What is the main building block of a Flutter app?',
      'options': ['State', 'Function', 'Class', 'Package'],
      'correctAnswer': 2,
    },
    {
      'question': 'Which of the following is not a widget in Flutter?',
      'options': ['Scaffold', 'Text', 'Button', 'View'],
      'correctAnswer': 3,
    },
  ];

  List<String> selectedOptions = [];
  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    pageController.addListener(() {
      isFinalQuestion.value = !(_currentPageIndex < questions.length - 1);
    });
    selectedOptions = List<String>.filled(questions.length, '');
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
    if (_currentPageIndex < questions.length - 1) {
      _currentPageIndex++;
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousQuestion() {
    if (_currentPageIndex > 0) {
      _currentPageIndex--;
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void selectOption(String option) {
    selectedOptions[_currentPageIndex] = option;
  }

  void submitAnswer() {
    Get.toNamed(Routes.RESULTS_PAGE);
  }
}
