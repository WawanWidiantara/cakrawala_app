import 'dart:convert';

import 'package:cakrawala_app/app/core/components/snackbar.dart';
import 'package:cakrawala_app/app/core/constants/url.dart';
import 'package:cakrawala_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final getStorage = GetStorage();

  final count = 0.obs;
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
    super.onClose();
  }

  void increment() => count.value++;
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
        SnackBarWidget.showSnackBar('Success', "Welcome Back", 'success');
        await getUser();
      } else {
        final errorData = json.decode(response.body);
        SnackBarWidget.showSnackBar(
            'Error', errorData['message'] ?? 'Login failed', 'err');
      }
    } catch (e) {
      SnackBarWidget.showSnackBar('Error', "$e", 'err');
    }
  }

  Future<void> getUser() async {
    final String? token = getStorage.read('token');
    final String? user = getStorage.read('user');
    final String url = '${UrlApi.baseAPI}/profile/$user';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );

      if (response.statusCode < 300) {
        final data = json.decode(response.body);
        getStorage.write('user_details', data["data"]);
        Get.offAllNamed(Routes.NAVBAR);
      }
    } catch (e) {
      SnackBarWidget.showSnackBar('Error', "$e", 'err');
    }
  }
}
