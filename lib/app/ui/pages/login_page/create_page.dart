import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiragana/app/controllers/auth_controller.dart';
import 'package:hiragana/app/routes/app_routes.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final AuthController _authController = Get.put(AuthController());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101C22),
      body: CustomPaint(
        painter: _JapanesePatternPainter(),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: Text(
                'Create Account',
                style: GoogleFonts.lexend(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              backgroundColor: const Color(0xFF101C22).withOpacity(0.8),
              pinned: true,
              elevation: 0,
              flexibleSpace: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 32),
                        _buildHeadline(),
                        const SizedBox(height: 32),
                        _buildSocialSignUp(),
                        const SizedBox(height: 24),
                        _buildSeparator(),
                        const SizedBox(height: 24),
                        _buildRegistrationForm(),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 32),
                        _buildTermsAndPolicy(),
                        const SizedBox(height: 40),
                        _buildBottomNavigation(),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeadline() {
    return Column(
      children: [
        Text(
          'Join Nihongo',
          style: GoogleFonts.lexend(
              fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(
          'Master Hiragana, Katakana, and Kanji',
          style:
              GoogleFonts.lexend(fontSize: 14, color: const Color(0xFF92B7C9)),
        ),
      ],
    );
  }

  Widget _buildSocialSignUp() {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(Icons.login,
            color: Colors.black), // Placeholder for Google Icon
        label: Text(
          'Sign up with Google',
          style: GoogleFonts.lexend(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
      ),
    );
  }

  Widget _buildSeparator() {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey.shade800)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'OR',
            style: GoogleFonts.lexend(
              color: const Color(0xFF92B7C9),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(child: Divider(color: Colors.grey.shade800)),
      ],
    );
  }

  Widget _buildRegistrationForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextFieldLabel('Email Address'),
        const SizedBox(height: 8),
        _buildEmailField(),
        const SizedBox(height: 16),
        _buildTextFieldLabel('Password'),
        const SizedBox(height: 8),
        _buildPasswordField(),
        const SizedBox(height: 24),
        _buildCreateAccountButton(),
      ],
    );
  }

  Widget _buildTextFieldLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Text(
        label.toUpperCase(),
        style: GoogleFonts.lexend(
          color: const Color(0xFF92B7C9),
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.1,
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return TextField(
      controller: _emailController,
      style: GoogleFonts.lexend(fontSize: 16, color: Colors.white),
      decoration: InputDecoration(
        hintText: 'name@example.com',
        hintStyle: GoogleFonts.lexend(color: Colors.grey.shade600),
        prefixIcon: Icon(Icons.mail, color: Colors.grey.shade500),
        filled: true,
        fillColor: const Color(0xFF1A2A32),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.all(20),
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      controller: _passwordController,
      obscureText: _obscureText,
      style: GoogleFonts.lexend(fontSize: 16, color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Create a password',
        hintStyle: GoogleFonts.lexend(color: Colors.grey.shade600),
        prefixIcon: Icon(Icons.lock, color: Colors.grey.shade500),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey.shade500,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        filled: true,
        fillColor: const Color(0xFF1A2A32),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.all(20),
      ),
    );
  }

  Widget _buildCreateAccountButton() {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          final email = _emailController.text.trim();
          final password = _passwordController.text.trim();
          if (email.isNotEmpty && password.isNotEmpty) {
            final user = await _authController.signUpWithEmailAndPassword(
                email, password);
            if (user != null) {
              Get.offAllNamed(AppRoutes.HOME);
            } else {
              Get.snackbar("Error", "Registration failed. Please try again.",
                  backgroundColor: Colors.red, colorText: Colors.white);
            }
          } else {
            Get.snackbar("Error", "Please enter both email and password.",
                backgroundColor: Colors.orange, colorText: Colors.white);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2BADEE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          elevation: 5,
          shadowColor: const Color(0xFF2BADEE).withOpacity(0.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Create Account',
              style: GoogleFonts.lexend(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildTermsAndPolicy() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: GoogleFonts.lexend(
              fontSize: 12, color: Colors.grey.shade500, height: 1.5),
          children: [
            const TextSpan(text: 'By creating an account, you agree to our '),
            TextSpan(
              text: 'Terms of Service',
              style: const TextStyle(color: Color(0xFF2BADEE)),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
            const TextSpan(text: ' and '),
            TextSpan(
              text: 'Privacy Policy',
              style: const TextStyle(color: Color(0xFF2BADEE)),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
            const TextSpan(text: '.'),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.lexend(fontSize: 14, color: const Color(0xFF92B7C9)),
        children: [
          const TextSpan(text: 'Already have an account? '),
          TextSpan(
            text: 'Log in',
            style: const TextStyle(
                color: Color(0xFF2BADEE), fontWeight: FontWeight.bold),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
        ],
      ),
    );
  }
}

class _JapanesePatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF2BADEE).withOpacity(0.07)
      ..style = PaintingStyle.fill;

    const double radius = 1;
    const double spacing = 24;

    for (double y = 0; y < size.height; y += spacing) {
      for (double x = 0; x < size.width; x += spacing) {
        canvas.drawCircle(Offset(x, y), radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
