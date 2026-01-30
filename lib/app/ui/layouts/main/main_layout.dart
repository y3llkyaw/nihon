import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiragana/app/controllers/tts_controller.dart';
import '../../../controllers/main_controller.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';

class MainLayout extends GetView<MainController> {
  final Widget child;
  MainLayout({Key? key, required this.child}) : super(key: key);
  final tts = Get.put(TtsController());
  @override
  Widget build(BuildContext context) {
    return Center(child: child);
  }
}
