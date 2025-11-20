import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiragana/app/routes/app_routes.dart';

class UnknownRoutePage extends StatelessWidget {
  const UnknownRoutePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '404',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Page Not Found',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.offAllNamed(AppRoutes.HOME),
              child: const Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
