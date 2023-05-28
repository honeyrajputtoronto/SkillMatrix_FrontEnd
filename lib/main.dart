import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:skillmatrix/theme/themes.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Skill Matrix",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: getBlackWhiteTheme(),
    ),
  );
}
