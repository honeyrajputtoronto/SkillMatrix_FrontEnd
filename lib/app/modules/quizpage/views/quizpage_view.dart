import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:skillmatrix/app/modules/quizpage/views/quiz_page.dart';

import '../controllers/quizpage_controller.dart';

class QuizpageView extends GetView<QuizpageController> {
  const QuizpageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuizpageView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller.pageController,
              itemCount: controller.questions.length,
              itemBuilder: (context, index) {
                return QuizPage(index: index);
              },
            ),
          ),
          const SizedBox(height: 16),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // ElevatedButton(
                //   onPressed: controller.previousQuestion,
                //   child: const Text('Previous'),
                // ),
                MaterialButton(
                  onPressed: () => controller.isFinalQuestion.value
                      ? controller.submitAnswer()
                      : controller.nextQuestion(),
                  child: Container(
                    width: 150,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        controller.isFinalQuestion.value ? "Submit" : "Next",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
