import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/results_page_controller.dart';

class ResultsPageView extends GetView<ResultsPageController> {
  const ResultsPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              child: SvgPicture.network(
                'https://i.pravatar.cc/200',
                placeholderBuilder: (BuildContext context) =>
                    CircularProgressIndicator(),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Congratulations!',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              'You have cleared first round!',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 32),
            MaterialButton(
              onPressed: () => Get.toNamed(Routes.DASHBOARD),
              child: Container(
                width: 200,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                  child: Text(
                    "Start next level",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
