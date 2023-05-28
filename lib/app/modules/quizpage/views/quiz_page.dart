import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/quizpage_controller.dart';

class QuizPage extends StatefulWidget {
  QuizPage({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;
  final QuizpageController controller = Get.find();
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    final question = widget.controller.questions[widget.index];
    final options = question['options'] as List<String>;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            question['question'],
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Column(
            children: options
                .map(
                  (option) => RadioListTile<String>(
                      title: Text(option,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      value: option,
                      groupValue:
                          widget.controller.selectedOptions[widget.index],
                      onChanged: (value) {
                        setState(() {
                          widget.controller.selectOption(value!);
                        });
                      }),
                )
                .toList(),
          ),
        ],
      ),
    );
    ;
  }
}
