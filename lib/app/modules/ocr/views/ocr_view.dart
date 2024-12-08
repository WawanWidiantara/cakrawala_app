import 'package:cakrawala_app/app/core/components/buttons.dart';
import 'package:cakrawala_app/app/core/constants/colors.dart';
import 'package:cakrawala_app/app/core/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/ocr_controller.dart';

class OcrView extends GetView<OcrController> {
  const OcrView({super.key});
  @override
  Widget build(BuildContext context) {
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
          iconTheme: const IconThemeData(color: AppColors.mainBackground),
        ),
        body: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Headline(),
                      const SizedBox(height: 32),
                      Center(
                        child: SvgPicture.asset(
                          'assets/images/pick-image.svg',
                          height: 300,
                        ),
                      ),
                      const SizedBox(height: 64),
                      Button(
                        label: 'Open Camera',
                        type: ButtonType.primary,
                        state: ButtonState.enabled,
                        onPressed: () {
                          controller.getKTPImage(
                            ImageSource.camera,
                          );
                        },
                      ),
                      Button(
                        label: 'Upload from Gallery',
                        type: ButtonType.tertiary,
                        state: ButtonState.enabled,
                        onPressed: () {
                          controller.getKTPImage(
                            ImageSource.gallery,
                          );
                        },
                      ),
                    ],
                  ),
                ),
        ),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Create Your Account',
          style: AppTypography.headlineSmall.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
            'Take a photo of your KTP or insert a photo of your KTP from the Gallery',
            style: AppTypography.titleSmall.copyWith(
              height: 1.5,
            )),
      ],
    );
  }
}
