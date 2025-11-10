import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiragana/app/controllers/character_table_controller.dart';
import 'package:hiragana/app/controllers/home_controller.dart';
import 'package:hiragana/app/ui/pages/character_page/character_page.dart';
import 'package:hiragana/app/ui/pages/vocab_page/vocab_page.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);
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
      appBar: AppBar(
        title: Title(
          color: Colors.black,
          title: "Hello",
          child: Text("Hiraku"),
        ),
      ),
      body: Obx(
        () => homeController.currentIndex.value == 0
            ? CharacterPage()
            : VocabPage(),
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
                icon: Icon(Icons.book),
                label: "Learn",
              ),
            ]),
      ),
    );
  }
}
