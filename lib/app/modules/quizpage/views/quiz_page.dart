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
    final question = widget.controller.data.docs[widget.index].data();
    final options = question['options'] as Map<String, dynamic>;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width / 4, vertical: 20),
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ]),
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              question['question'],
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Column(
              children: options.entries
                  .map(
                    (option) => RadioListTile<String>(
                        title: Text(option.value,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        value: option.key,
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
            const SizedBox(
              height: 50,
            ),
            Text(
              "${widget.index}/${widget.controller.data.docs.length}",
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
    ;
  }
}
