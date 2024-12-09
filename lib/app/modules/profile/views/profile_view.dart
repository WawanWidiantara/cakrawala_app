import 'package:cakrawala_app/app/core/components/buttons.dart';
import 'package:cakrawala_app/app/core/constants/colors.dart';
import 'package:cakrawala_app/app/core/constants/text_styles.dart';
import 'package:cakrawala_app/app/modules/profile/views/detail_profile_view.dart';
import 'package:cakrawala_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
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
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("My Profile",
                      style: AppTypography.titleMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      )),
                  Obx(() {
                    return GestureDetector(
                      onTap: controller.userDetails["name"] == null
                          ? null
                          : () {
                              Get.to(() => const DetailProfileView());
                            },
                      child: Text("See all",
                          style: AppTypography.bodyMedium.copyWith(
                            color: controller.userDetails["name"] == null
                                ? AppColors.formStroke
                                : AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          )),
                    );
                  }),
                ],
              ),
              const SizedBox(height: 20),
              Obx(() {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(controller
                                .userDetails["photo_url"] ??
                            "https://www.pngkey.com/png/full/114-1149878_setting-user-avatar-in-specific-size-without-breaking.png"),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        controller.userDetails["name"] ?? "John Doe",
                        style: AppTypography.titleMedium.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              }),
              const SizedBox(height: 16),
              Obx(() {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Email", style: AppTypography.bodyMedium),
                          Text(
                              controller.userDetails["email"] ??
                                  "cakrawala@mail.com",
                              style: AppTypography.bodyMedium.copyWith(
                                color: AppColors.formStroke,
                              )),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("No. Telepon", style: AppTypography.bodyMedium),
                          Text(
                              controller.userDetails["phone"] ?? "082112457852",
                              style: AppTypography.bodyMedium.copyWith(
                                color: AppColors.formStroke,
                              )),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(() {
                if (controller.userDetails["name"] == null) {
                  return Button(
                    label: 'Activate Account',
                    type: ButtonType.primary,
                    state: ButtonState.enabled,
                    onPressed: () {
                      Get.offAllNamed(Routes.OCR);
                    },
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: LogOutButton(onPressed: () {
                  controller.logout();
                }),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.mainBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(
              color: AppColors.error,
              width: 1,
            ),
          ),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Text("Logout",
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.error,
              fontWeight: FontWeight.bold,
            )));
  }
}
