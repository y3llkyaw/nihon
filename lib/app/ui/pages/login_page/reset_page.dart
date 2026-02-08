import 'package:flutter/material.dart';
import 'package:hiragana/app/ui/theme/theme.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiragana/app/controllers/auth_controller.dart';

class ResetPage extends StatelessWidget {
  ResetPage({Key? key}) : super(key: key);
  final AuthController _authController = Get.put(AuthController());
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: AppColors.backgroundDark,
      body: Stack(
        children: [
          _buildBackgroundGlow(context),
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 32),
                        _buildHeaderIcon(),
                        const SizedBox(height: 24),
                        _buildHeadline(),
                        const SizedBox(height: 16),
                        _buildBodyText(),
                        const SizedBox(height: 32),
                        _buildForm(),
                        const SizedBox(height: 40),
                        _buildJapaneseMotif(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundGlow(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: -40.0,
          right: -20.0,
          child: Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary.withValues(alpha: 0.05),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderIcon() {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
      ),
      child: const Center(
        child: Icon(
          Icons.lock_reset,
          color: AppColors.primary,
          size: 40,
        ),
      ),
    );
  }

  Widget _buildHeadline() {
    return Text(
      'Reset Password',
      style: GoogleFonts.lexend(
        color: Colors.white,
        fontSize: 34,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildBodyText() {
    return Text(
      "Enter the email address associated with your account and we'll send you a link to reset your password.",
      style: GoogleFonts.lexend(
        color: Colors.white.withValues(alpha: 0.7),
        fontSize: 16,
        height: 1.5,
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email address',
          style: GoogleFonts.lexend(
            color: Colors.white.withValues(alpha: 0.9),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _emailController,
          style: GoogleFonts.lexend(fontSize: 16, color: Colors.white),
          decoration: InputDecoration(
            hintText: 'example@email.com',
            hintStyle:
                GoogleFonts.lexend(color: Colors.white.withValues(alpha: 0.3)),
            prefixIcon: Icon(
              Icons.mail_outline,
              color: Colors.white.withValues(alpha: 0.4),
            ),
            filled: true,
            fillColor: Colors.white.withValues(alpha: 0.05),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide:
                  BorderSide(color: Colors.white.withValues(alpha: 0.1)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide:
                  BorderSide(color: Colors.white.withValues(alpha: 0.1)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                  color: AppColors.primary.withValues(alpha: 0.5), width: 2),
            ),
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton.icon(
            onPressed: () async {
              final email = _emailController.text.trim();
              if (email.isNotEmpty) {
                await _authController.sendEmailResetLink(email);
              } else {
                Get.snackbar("Error", "Please enter your email address.",
                    backgroundColor: Colors.red, colorText: Colors.white);
              }
            },
            icon: const Icon(Icons.send, size: 20, color: Colors.black),
            label: Text(
              'Send Reset Link',
              style: GoogleFonts.lexend(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
              elevation: 4,
              shadowColor: AppColors.primary.withValues(alpha: 0.3),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildJapaneseMotif() {
    return Center(
      child: RotatedBox(
        quarterTurns: 3,
        child: Text(
          '日本語',
          style: GoogleFonts.lexend(
            color: Colors.white.withValues(alpha: 0.05),
            fontSize: 60,
            fontWeight: FontWeight.bold,
            letterSpacing: 10,
          ),
        ),
      ),
    );
  }
}
