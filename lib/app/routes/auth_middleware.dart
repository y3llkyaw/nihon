import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiragana/app/routes/app_routes.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // Check if there's a currently logged-in user
    final user = FirebaseAuth.instance.currentUser;

    // If no user is logged in, redirect to the landing page.
    if (user == null) {
      return RouteSettings(name: AppRoutes.LANDING);
    }
    return null; // No redirect
  }
}
