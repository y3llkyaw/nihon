import 'package:firebase_core/firebase_core.dart';
import 'package:hiragana/firebase_options.dart';
import 'package:hiragana/app/controllers/navigation_controller.dart';
import 'package:hiragana/app/controllers/main_controller.dart';
import 'package:hiragana/app/controllers/user_controller.dart';
import 'package:hiragana/app/controllers/sub_controllers.dart';
import 'package:hiragana/app/data/repositories/japanese_data_repository.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DependecyInjection {
  static Future<void> init() async {
    await GetStorage.init();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Initialize Japanese Data Repository (loads from cache or Firebase)
    final japaneseDataRepo = JapaneseDataRepository();
    Get.put<JapaneseDataRepository>(japaneseDataRepo);

    // Initialize data in background (will use cache if available)
    japaneseDataRepo.initialize().catchError((error) {
      print('⚠️ Failed to initialize Japanese data: $error');
      // App will continue with cached data if available
    });

    Get.put<NavigationController>(NavigationController());
    Get.put<MainController>(MainController());

    // Register sub-controllers before UserController (it depends on them)
    Get.put<UserProgressController>(UserProgressController());
    Get.put<StreakController>(StreakController());
    Get.put<StarredVocabController>(StarredVocabController());
    Get.put<UserController>(UserController());
  }
}
