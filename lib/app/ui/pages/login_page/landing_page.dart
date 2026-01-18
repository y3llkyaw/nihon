import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiragana/app/controllers/auth_controller.dart';
import 'package:hiragana/app/ui/pages/login_page/create_page.dart';
import 'package:hiragana/app/ui/pages/login_page/login_page.dart';
import 'package:icons_plus/icons_plus.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);
  final AuthController authController = AuthController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFF101C22),
      body: SafeArea(
        child: Stack(
          children: [
            const Positioned(
              bottom: -80,
              right: -80,
              child: Text(
                '語',
                style: TextStyle(
                  fontSize: 300,
                  fontWeight: FontWeight.bold,
                  color: Colors.white10,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildLogo(),
                _buildHeadline(),
                const SizedBox(height: 48),
                _buildAuthButtons(context),
                _buildSignUpSection(),
                _buildFooter(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Center(
        child: Container(
          width: 128,
          height: 128,
          decoration: BoxDecoration(
            color: const Color(0xFF2BADEE).withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFF2BADEE).withValues(alpha: 0.3),
              width: 2,
            ),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Opacity(
                  opacity: 0.1,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    spacing: 4.0,
                    runSpacing: 4.0,
                    children: List.generate(
                      25,
                      (index) => const Text(
                        'あ',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const Center(
                child: Icon(
                  Icons.translate,
                  size: 64,
                  color: Color(0xFF2BADEE),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeadline() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Text(
            'Nihongo Guide',
            textAlign: TextAlign.center,
            style: GoogleFonts.lexend(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              'Master Hiragana, Katakana, and Kanji with ease.',
              textAlign: TextAlign.center,
              style: GoogleFonts.lexend(
                color: Colors.white.withValues(alpha: 0.6),
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAuthButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton.icon(
              onPressed: () async {
                await authController.signInWithGoogle();
              },
              icon: Brand(Brands.google), // Placeholder for Google Icon
              label: Text(
                'Continue with Google',
                style: GoogleFonts.lexend(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: OutlinedButton.icon(
              onPressed: () {
                Get.to(() => const LoginPage());
              },
              icon: const Icon(Icons.mail, color: Colors.white),
              label: Text(
                'Login with Email',
                style: GoogleFonts.lexend(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.white.withValues(alpha: 0.2)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
          child: Row(
            children: [
              Expanded(
                  child: Divider(color: Colors.white.withValues(alpha: 0.1))),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'or',
                  style: GoogleFonts.lexend(
                    color: Colors.white.withValues(alpha: 0.3),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                  child: Divider(color: Colors.white.withValues(alpha: 0.1))),
            ],
          ),
        ),
        Text(
          'New to Nihongo Guide?',
          style: GoogleFonts.lexend(
            color: Colors.white.withValues(alpha: 0.6),
            fontSize: 14,
          ),
        ),
        TextButton(
          onPressed: () {
            Get.to(() => const CreatePage());
          },
          child: Text(
            'Create a New Account',
            style: GoogleFonts.lexend(
              color: const Color(0xFF2BADEE),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32, bottom: 32, top: 16),
      child: Text(
        'By continuing, you agree to our Terms of Service and Privacy Policy. Nihongo Guide uses cookies to provide a better learning experience.',
        textAlign: TextAlign.center,
        style: GoogleFonts.lexend(
          color: Colors.white.withValues(alpha: 0.3),
          fontSize: 10,
        ),
      ),
    );
  }
}
