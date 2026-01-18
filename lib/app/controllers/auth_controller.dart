import 'package:get/get.dart';
import 'package:hiragana/app/data/services/google_signin_service.dart';

class AuthController extends GetxController {
  Future<void> signInWithGoogle() async {
    try {
      final userCredential = await GoogleSignInService.signInWithGoogle();
      if (userCredential != null) {
        // Handle successful sign-in
        print('User signed in: ${userCredential.user?.displayName}');
      }
    } catch (e) {
      // Handle sign-in error
      print('Error during Google sign-in: $e');
    }
  }
}
