import 'dart:convert';
import 'package:cakrawala_app/app/core/components/snackbar.dart';
import 'package:cakrawala_app/app/core/constants/url.dart';
import 'package:cakrawala_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final count = 0.obs;
  final getStorage = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> register() async {
    if (!formKey.currentState!.validate()) {
      return; // Form is invalid
    }

    final String email = emailController.text.trim();
    final String phone = phoneController.text.trim();
    final String password = passwordController.text.trim();
    final String confirmPassword = confirmPasswordController.text.trim();

    const String url = '${UrlApi.baseAPI}/auth/register';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
          'confirm_password': confirmPassword,
          'phone': phone,
        }),
      );

      if (response.statusCode < 300) {
        await login();
      } else {
        final errorData = json.decode(response.body);
        SnackBarWidget.showSnackBar(
            'Error', errorData['message'] ?? 'Register failed', 'err');
      }
    } catch (e) {
      SnackBarWidget.showSnackBar('Error', "$e", 'err');
    }
  }

  Future<void> login() async {
    if (!formKey.currentState!.validate()) {
      return; // Form is invalid
    }

    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    const String url = '${UrlApi.baseAPI}/auth/login';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode < 300) {
        final data = json.decode(response.body);
        getStorage.write('token', data['token']);
        getStorage.write('user', data['data']["id_account"]);
        Get.offAllNamed(Routes.OCR);
      } else {
        final errorData = json.decode(response.body);
        SnackBarWidget.showSnackBar(
            'Error', errorData['message'] ?? 'Register failed', 'err');
      }
    } catch (e) {
      SnackBarWidget.showSnackBar('Error', "$e", 'err');
    }
  }
}
