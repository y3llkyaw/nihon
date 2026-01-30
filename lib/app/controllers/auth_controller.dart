import 'dart:developer';

import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hiragana/app/controllers/user_controller.dart';

class AuthController extends GetxController {
  Future<UserCredential?> signInWithGoogle() async {
    // Set the language for the auth flow to prevent the X-Firebase-Locale warning.
    await FirebaseAuth.instance
        .setLanguageCode(Get.locale?.languageCode ?? 'en');

    try {
      // Trigger the authentication flow
      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: GetPlatform.isWeb
            ? "745869725996-4jpl2m5v1j7m4s6b90sl97hbvr5docv0.apps.googleusercontent.com"
            : null,
      );
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      log("Google User: ${googleUser?.email}");
      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      log("Google Credential created");
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      log("Firebase User: ${userCredential.user?.email}");
      if (userCredential.user != null) {
        // Ensure UserController is ready and create/update the user document.
        final userController = Get.put(UserController());
        await userController.createUserDocument(userCredential.user!);
      }
      // Sign in to Firebase with the credential
      return userCredential;
    } on FirebaseAuthException catch (e) {
      log("Firebase Auth Error: ${e.message}");
      return null;
    } catch (e) {
      log("Google Sign-In Error: $e");
      return null;
    }
  }

  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      log("Firebase User (Email): ${userCredential.user?.email}");
      if (userCredential.user != null) {
        final userController = Get.put(UserController());
        await userController.createUserDocument(userCredential.user!);
      }
      return userCredential;
    } on FirebaseAuthException catch (e) {
      log("Firebase Auth Error: ${e.message}");
      return null;
    } catch (e) {
      log("Sign-In Error: $e");
      return null;
    }
  }

  Future<void> sendEmailResetLink(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      log("Send Email Reset Link Error: $e");
    }
  }

  Future<UserCredential?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      log("Firebase User (Email): ${userCredential.user?.email}");
      if (userCredential.user != null) {
        final userController = Get.put(UserController());
        await userController.createUserDocument(userCredential.user!);
      }
      return userCredential;
    } on FirebaseAuthException catch (e) {
      log("Firebase Auth Error: ${e.message}");
      return null;
    } catch (e) {
      log("Sign-Up Error: $e");
      return null;
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }
}
