import 'package:cakrawala_app/app/core/components/buttons.dart';
import 'package:cakrawala_app/app/core/constants/colors.dart';
import 'package:cakrawala_app/app/core/constants/text_styles.dart';
import 'package:cakrawala_app/app/modules/auth/views/login_view.dart';
import 'package:cakrawala_app/app/modules/auth/views/register_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/on_boarding_controller.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  const OnBoardingView({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    return SafeArea(
      child: Scaffold(
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
      ),
    );
  }
}

// ImageOnBoarding widget
class ImageOnBoarding extends StatelessWidget {
  const ImageOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'assets/images/on-boarding-1.jpg',
      'assets/images/on-boarding-2.jpg',
      'assets/images/on-boarding-3.jpg',
    ];

    return CarouselSlider(
      options: CarouselOptions(
        height: Get.height * 0.4,
        autoPlay: true,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        viewportFraction: 1,
        aspectRatio: 16 / 9,
      ),
      items: images.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
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
        height: 1.2,
      ),
    );
  }
}
