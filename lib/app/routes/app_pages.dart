import 'package:get/get.dart';
import 'package:hiragana/app/routes/middlewares.dart';

import '../bindings/home_binding.dart';
import '../ui/pages/home_page/home_page.dart';
import '../ui/pages/unknown_route_page/unknown_route_page.dart';
import '../ui/pages/vocab_flash_card_page/vocab_flash_card_page.dart';
import '../ui/pages/vocab_lesson_page/vocab_lesson_page.dart';
import '../ui/pages/vocab_page/vocab_page.dart';
import 'app_routes.dart';

const _defaultTransition = Transition.native;

class AppPages {
  static final unknownRoutePage = GetPage(
    name: AppRoutes.UNKNOWN,
    page: () => const UnknownRoutePage(),
    transition: _defaultTransition,
  );

  static final List<GetPage> pages = [
    unknownRoutePage,
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.VOCABULARY,
      page: () => const VocabPage(),
      transition: _defaultTransition,
      children: [
        GetPage(
          name: AppRoutes.VOCAB_LESSON,
          page: () => VocabLessonPage(),
          middlewares: [VocabLessonMiddleware()],
          children: [
            GetPage(
              name: AppRoutes.VOCAB_FLASHCARD,
              page: () => VocabFlashCardPage(),
            )
          ],
        ),
      ],
    ),
  ];
}
