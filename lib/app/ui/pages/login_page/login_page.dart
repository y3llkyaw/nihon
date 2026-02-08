import 'package:flutter/material.dart';
import 'package:hiragana/app/ui/theme/theme.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiragana/app/controllers/auth_controller.dart';
import 'package:hiragana/app/routes/app_routes.dart';
import 'package:hiragana/app/ui/pages/login_page/reset_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthController _authController = Get.put(AuthController());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          '',
          style: GoogleFonts.lexend(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          _buildBackgroundDecorations(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  _buildHeaderIcon(),
                  _buildHeadline(),
                  const SizedBox(height: 32),
                  _buildLoginForm(),
                  const SizedBox(height: 16),
                  _buildForgotPassword(),
                  const SizedBox(height: 32),
                  _buildLoginButton(),
                  const SizedBox(height: 40),
                  _buildCreateAccountSection(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundDecorations() {
    return Stack(
      children: [
        Positioned(
          top: 20,
          left: -40,
          child: Text('あ',
              style: GoogleFonts.lexend(
                  fontSize: 120,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary.withValues(alpha: 0.1))),
        ),
        Positioned(
          bottom: 40,
          right: -40,
          child: Text('か',
              style: GoogleFonts.lexend(
                  fontSize: 140,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary.withValues(alpha: 0.1))),
        ),
        Positioned.fill(
          child: Center(
            child: Text('語',
                style: GoogleFonts.lexend(
                    fontSize: 200,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary.withValues(alpha: 0.05))),
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderIcon() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Container(
        width: 96,
        height: 96,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primary.withValues(alpha: 0.2),
          border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.4), width: 2),
        ),
        child: Center(
          child: Text(
            'あ',
            style: GoogleFonts.lexend(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: AppColors.primary),
          ),
        ),
      ),
    );
  }

  Widget _buildHeadline() {
    return Column(
      children: [
        Text(
          'Welcome Back',
          style: GoogleFonts.lexend(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Text(
            'Sign in to sync your flashcard progress and continue learning.',
            textAlign: TextAlign.center,
            style:
                GoogleFonts.lexend(fontSize: 16, color: Colors.grey.shade400),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email Address',
          style: GoogleFonts.lexend(
              fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _emailController,
          style: GoogleFonts.lexend(fontSize: 16, color: Colors.white),
          decoration: InputDecoration(
            hintText: 'e.g., sensei@example.jp',
            hintStyle: GoogleFonts.lexend(color: Colors.grey.shade600),
            filled: true,
            fillColor: AppColors.cardDark,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: BorderSide(color: AppColors.borderDark),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: BorderSide(color: AppColors.borderDark),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Password',
          style: GoogleFonts.lexend(
              fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _passwordController,
          obscureText: _obscureText,
          style: GoogleFonts.lexend(fontSize: 16, color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Enter your password',
            hintStyle: GoogleFonts.lexend(color: Colors.grey.shade600),
            filled: true,
            fillColor: AppColors.cardDark,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: BorderSide(color: AppColors.borderDark),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: BorderSide(color: AppColors.borderDark),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey.shade500,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Get.to(() => ResetPage());
        },
        child: Text(
          'Forgot Password?',
          style: GoogleFonts.lexend(
            color: AppColors.primary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () async {
          final email = _emailController.text.trim();
          final password = _passwordController.text.trim();
          if (email.isNotEmpty && password.isNotEmpty) {
            final user = await _authController.signInWithEmailAndPassword(
                email, password);
            if (user != null) {
              Get.offAllNamed(AppRoutes.HOME);
            } else {
              Get.snackbar(
                  "Error", "Login failed. Please check your credentials.",
                  backgroundColor: Colors.red, colorText: Colors.white);
            }
          } else {
            Get.snackbar("Error", "Please enter both email and password.",
                backgroundColor: Colors.orange, colorText: Colors.white);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          elevation: 5,
          shadowColor: AppColors.primary.withValues(alpha: 0.4),
        ),
        child: Text(
          'Login',
          style: GoogleFonts.lexend(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildCreateAccountSection() {
    return Column(
      children: [
        Text(
          "Don't have an account?",
          style: GoogleFonts.lexend(color: Colors.grey.shade500, fontSize: 14),
        ),
        const SizedBox(height: 16),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            side: BorderSide(color: AppColors.borderDark),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
          ),
          child: Text(
            'Create Account',
            style: GoogleFonts.lexend(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
