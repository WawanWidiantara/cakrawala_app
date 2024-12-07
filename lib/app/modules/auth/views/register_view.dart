import 'package:cakrawala_app/app/core/components/buttons.dart';
import 'package:cakrawala_app/app/core/components/forms.dart';
import 'package:cakrawala_app/app/core/constants/colors.dart';
import 'package:cakrawala_app/app/core/constants/text_styles.dart';
import 'package:cakrawala_app/app/modules/auth/controllers/register_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
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
        iconTheme: const IconThemeData(color: AppColors.mainBackground),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Headline(),
                  const SizedBox(height: 32),
                  FormWidget(
                      controller: controller.emailController,
                      label: 'Email',
                      isObsecured: false,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      }),
                  const SizedBox(height: 20),
                  FormWidget(
                      controller: controller.passwordController,
                      label: 'Password',
                      isObsecured: false,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      }),
                  const SizedBox(height: 20),
                  FormWidget(
                      controller: controller.passwordController,
                      label: 'Confirm Password',
                      isObsecured: false,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your confirm password';
                        }
                        return null;
                      }),
                  const SizedBox(height: 72),
                  Button(
                    label: 'Register',
                    type: ButtonType.primary,
                    state: ButtonState.enabled,
                    onPressed: () {
                      controller.register();
                    },
                  ),
                ],
              ),
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
    return Text(
      'Create Your Account',
      style: AppTypography.headlineSmall.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
