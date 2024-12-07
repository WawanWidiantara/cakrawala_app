import 'package:cakrawala_app/app/core/components/buttons.dart';
import 'package:cakrawala_app/app/core/constants/colors.dart';
import 'package:cakrawala_app/app/core/constants/text_styles.dart';
import 'package:cakrawala_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

class OcrSuccessView extends GetView {
  const OcrSuccessView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ImageSuccess(),
            const SizedBox(height: 16),
            const Headline(),
            const SizedBox(height: 64),
            Button(
              label: 'Go to Home',
              type: ButtonType.primary,
              state: ButtonState.enabled,
              onPressed: () {
                Get.offAllNamed(Routes.NAVBAR);
              },
            ),
            Button(
              label: 'View Profile',
              type: ButtonType.tertiary,
              state: ButtonState.enabled,
              onPressed: () {
                Get.offAllNamed(arguments: 2, Routes.NAVBAR);
              },
            ),
          ],
        ),
      )),
    );
  }
}

class ImageSuccess extends StatelessWidget {
  const ImageSuccess({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        'assets/images/ocr-success.svg',
        height: 300,
      ),
    );
  }
}

class Headline extends StatelessWidget {
  const Headline({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Your Identity is Verified!',
          style: AppTypography.headlineSmall.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
            "Your data has been successfully verified. You're one step closer to rent your dream car!",
            textAlign: TextAlign.center,
            style: AppTypography.titleSmall.copyWith(
              height: 1.5,
            )),
      ],
    );
  }
}
