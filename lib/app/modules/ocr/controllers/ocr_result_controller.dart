import 'dart:convert';

import 'package:cakrawala_app/app/core/components/snackbar.dart';
import 'package:cakrawala_app/app/core/constants/url.dart';
import 'package:cakrawala_app/app/modules/ocr/views/ocr_success_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class OcrResultController extends GetxController {
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

  var ocrResult = Get.arguments;
  RxBool isLoading = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    try {
      if (ocrResult != null) {
        nikController.text = ocrResult['nik'] ?? '';
        nameController.text = ocrResult['nama'] ?? '';
        religionController.text = ocrResult['agama'] ?? '';
        maritalController.text = ocrResult['status_perkawinan'] ?? '';
        occupationController.text = ocrResult['pekerjaan'] ?? '';
        genderPlaceController.text = ocrResult['jenis_kelamin'] ?? '';
        birthPlaceController.text = ocrResult["tempat_lahir"] ?? '';
        dobController.text = ocrResult["tanggal_lahir"] ?? '';
        provinceController.text = ocrResult["provinsi"] ?? '';
        regencyController.text = ocrResult["kabupaten"] ?? '';
        addressController.text = ocrResult['alamat'] ?? '';
        villageController.text = ocrResult['kel_desa'] ?? '';
        districtController.text = ocrResult['kecamatan'] ?? '';
        rtrwController.text = ocrResult["rt_rw"] ?? '';
        nationalityController.text = ocrResult['kewarganegaraan'] ?? '';
      }
    } catch (e) {
      return;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> saveProfile(String ktp, String photo) async {
    if (!formKey.currentState!.validate()) {
      return; // Form is invalid
    }

    final String nik = nikController.text.trim();
    final String name = nameController.text.trim();
    final String religion = religionController.text.trim();
    final String marital = maritalController.text.trim();
    final String occupation = occupationController.text.trim();
    final String genderPlace = genderPlaceController.text.trim();
    final String birthPlace = birthPlaceController.text.trim();
    final String dob = dobController.text.trim();
    final String province = provinceController.text.trim();
    final String regency = regencyController.text.trim();
    final String address = addressController.text.trim();
    final String village = villageController.text.trim();
    final String district = districtController.text.trim();
    final String rtrw = rtrwController.text.trim();
    final String nationality = nationalityController.text.trim();

    // do the same for other fields

    final box = GetStorage();
    final String? token = box.read('token');
    const String url = '${UrlApi.baseAPI}/profile/';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: json.encode(
          {
            "nik": nik,
            "name": name,
            "pob": birthPlace,
            "dob": dob,
            "gender": genderPlace,
            "religion": religion,
            "marital_status": marital,
            "occupation": occupation,
            "nationality": nationality,
            "photo_url": photo,
            "ktp_url": ktp,
            "province": province,
            "city": regency,
            "subdistrict": district,
            "village": village,
            "address": address,
            "rt": rtrw.split('/')[0],
            "rw": rtrw.split('/')[1]
          },
        ),
      );

      if (response.statusCode < 300) {
        await getUser();
      } else {
        final errorData = json.decode(response.body);
        SnackBarWidget.showSnackBar(
            'Error', errorData['error'] ?? 'Register failed', 'err');
      }
    } catch (e) {
      SnackBarWidget.showSnackBar('Error', "$e", 'err');
    }
  }

  Future<void> getUser() async {
    final box = GetStorage();
    final String? token = box.read('token');
    final String? user = box.read('user');
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
        box.write('user_details', data["data"]);
        Get.offAll(
          () => const OcrSuccessView(),
          transition: Transition.fadeIn,
          duration: const Duration(
            milliseconds: 500,
          ),
        );
      }
    } catch (e) {
      SnackBarWidget.showSnackBar('Error', "$e", 'err');
    }
  }

  void increment() => count.value++;
}
