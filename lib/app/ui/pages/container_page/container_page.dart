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
            showUnselectedLabels: false,
            showSelectedLabels: false,
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
                icon: Icon(Icons.abc),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: "Learn",
              ),
            ]),
      ),
    );
  }
}
