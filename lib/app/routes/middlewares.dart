import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiragana/app/data/enums/hiragana.dart';
import 'package:hiragana/app/routes/app_routes.dart';

class VocabLessonMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final lessonId = Get.parameters['lesson'];
    if (lessonId == null) {
      return const RouteSettings(name: AppRoutes.UNKNOWN);
    }
    final lessonIndex = int.tryParse(lessonId);
    if (lessonIndex == null ||
        lessonIndex - 1 < 0 ||
        lessonIndex - 1 >= vocabLessons.length) {
      return const RouteSettings(name: AppRoutes.UNKNOWN);
    }
    return null; // No redirect
  }
}
