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

  var ocrResult = Get.arguments;
  RxBool isLoading = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

    // Populate the form fields based on OCR result
    if (ocrResult != null) {
      nikController.text = ocrResult['nik'] ?? '';
      nameController.text = ocrResult['nama'] ?? '';
      addressController.text = ocrResult['alamat'] ?? '';
      villageController.text = ocrResult['kel_desa'] ?? '';
      districtController.text = ocrResult['kecamatan'] ?? '';
      regencyController.text = ''; // This key doesn't exist, add a fallback
      provinceController.text = ''; // This key doesn't exist, add a fallback
      religionController.text = ocrResult['agama'] ?? '';
      maritalController.text = ocrResult['status_perkawinan'] ?? '';
      occupationController.text = ocrResult['pekerjaan'] ?? '';
      nationalityController.text = ocrResult['kewarganegaraan'] ?? '';
      genderPlaceController.text = ocrResult['jenis_kelamin'] ?? '';
      rtrwController.text = ''; // If no specific RT/RW in the response
      if (ocrResult['tempat_tgl_lahir'] != null) {
        final birthInfo = ocrResult['tempat_tgl_lahir'].split(' ');
        if (birthInfo.length > 1) {
          birthPlaceController.text = birthInfo[0];
          dobController.text = birthInfo.sublist(1).join(' ');
        }
      }
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

  void increment() => count.value++;
}
