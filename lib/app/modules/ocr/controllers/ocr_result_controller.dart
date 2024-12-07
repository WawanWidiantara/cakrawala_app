import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OcrResultController extends GetxController {
  //TODO: Implement OcrResultController
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nikController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController birthPlaceController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController genderPlaceController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController rtrwController = TextEditingController();
  final TextEditingController villageController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController regencyController = TextEditingController();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController religionController = TextEditingController();
  final TextEditingController maritalController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();

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
}
