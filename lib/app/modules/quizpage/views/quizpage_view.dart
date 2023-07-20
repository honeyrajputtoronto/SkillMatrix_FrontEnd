import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillmatrix/app/modules/quizpage/views/quiz_page.dart';
import '../controllers/quizpage_controller.dart';
import '../../../../app_data.dart';

class QuizpageView extends GetView<QuizpageController> {
  const QuizpageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? const SizedBox(
                height: 100,
                child: Center(child: CircularProgressIndicator()),
              )
            : Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: controller.pageController,
                      itemCount: questionData.length ,
                      itemBuilder: (context, index) {
                        return QuizPage(index: index);
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  const SizedBox(height: 16),
                ],
              ),
      ),
    );
  }
}
