import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiragana/app/controllers/character_table_controller.dart';
import 'package:hiragana/app/controllers/home_controller.dart';
import 'package:hiragana/app/ui/pages/character_page/character_page.dart';
import 'package:hiragana/app/ui/pages/home_page/home_page.dart';
import 'package:hiragana/app/ui/pages/vocab_page/vocab_page.dart';

class ContainerPage extends GetView<HomeController> {
  const ContainerPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MobileViewLayout();
  }
}

class MobileViewLayout extends StatelessWidget {
  MobileViewLayout({Key? key}) : super(key: key);
  final characterTableController = Get.put(CharacterTableController());
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          switch (homeController.currentIndex.value) {
            case 0:
              return HomePage();
            case 1:
              return VocabPage();
            case 2:
            default:
              return CharacterPage();
          }
        },
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: const Color(0xFF101C22),
          unselectedItemColor: Colors.grey,
          selectedItemColor: const Color(0xFF2BADEE),
          showUnselectedLabels: true,
          showSelectedLabels: true,
          currentIndex: homeController.currentIndex.value,
          onTap: (value) {
            homeController.currentIndex.value = value;
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.book_fill),
              label: "Learn",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: "Review",
            ),
          ],
        ),
      ),
    );
  }
}
