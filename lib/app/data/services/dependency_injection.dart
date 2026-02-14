import 'package:firebase_core/firebase_core.dart';
import 'package:hiragana/firebase_options.dart';
import 'package:hiragana/app/controllers/navigation_controller.dart';
import 'package:hiragana/app/controllers/main_controller.dart';
import 'package:hiragana/app/controllers/user_controller.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DependecyInjection {
  static Future<void> init() async {
    await GetStorage.init();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    Get.put<NavigationController>(NavigationController());
    Get.put<MainController>(MainController());
    Get.put<UserController>(UserController());
  }
}
