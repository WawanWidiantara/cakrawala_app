import 'package:cakrawala_app/app/core/components/buttons.dart';
import 'package:cakrawala_app/app/core/constants/colors.dart';
import 'package:cakrawala_app/app/core/constants/text_styles.dart';
import 'package:cakrawala_app/app/modules/auth/views/login_view.dart';
import 'package:cakrawala_app/app/modules/auth/views/register_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/on_boarding_controller.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  const OnBoardingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      appBar: AppBar(
        title: const Text(
          'CAKRAWALA',
          style: TextStyle(
            color: AppColors.mainBackground,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ImageOnBoarding(),
            const SizedBox(height: 32),
            const Headline(),
            const SizedBox(height: 64),
            Button(
              label: 'Login',
              type: ButtonType.primary,
              state: ButtonState.enabled,
              onPressed: () {
                Get.to(() => const LoginView());
              },
            ),
            Button(
              label: 'Register',
              type: ButtonType.tertiary,
              state: ButtonState.enabled,
              onPressed: () {
                Get.to(() => const RegisterView());
              },
            ),
          ],
        ),
      )),
    );
  }
}

// ImageOnBoarding widget
class ImageOnBoarding extends StatelessWidget {
  const ImageOnBoarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.4,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/on-boarding-1.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
    );
  }
}

// Headline widget
class Headline extends StatelessWidget {
  const Headline({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Find Your Ride.\nFuel Your Journey.',
      style: AppTypography.headlineMedium.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
      ),
    );
  }
}