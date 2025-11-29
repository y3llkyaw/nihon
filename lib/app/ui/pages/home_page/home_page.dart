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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  opacity: 0.9,
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/image/bg.png',
                  ),
                ),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    color: Colors.grey.withValues(alpha: 0.6),
                    child: Text(
                      'Hiraku',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    color: Colors.grey.withValues(alpha: 0.6),
                    child: Text(
                      "Learn Japanese Easily",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.code),
              title: const Text('Developed by'),
              subtitle: const Text('Yell Htet Kyaw'),
              onTap: () {
                Get.back();
              },
            ),
          ],
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
