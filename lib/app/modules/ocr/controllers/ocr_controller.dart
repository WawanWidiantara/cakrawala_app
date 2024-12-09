import 'dart:convert';
import 'dart:io';
import 'package:cakrawala_app/app/core/components/snackbar.dart';
import 'package:cakrawala_app/app/core/constants/url.dart';
import 'package:cakrawala_app/app/modules/ocr/views/ocr_result_view.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class OcrController extends GetxController {
  var selectedImage = ''.obs;
  File? ktpImage;
  var ktp = ''.obs;
  var ocrResult = {}.obs;
  var isLoading = false.obs; // Reactive variable for loading state

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

  Future<void> getKTPImage(ImageSource imageSource) async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: imageSource);

    if (pickedFile != null) {
      ocrResult.clear();
      File receiptImage = File(pickedFile.path);
      selectedImage.value = pickedFile.path.toString();

      XFile? compressedImage = await compressImage(receiptImage);

      if (compressedImage != null) {
        await sendImage(compressedImage);
      } else {
        SnackBarWidget.showSnackBar(
          'Transaksi Gagal',
          'Error: Image compression failed.',
          'err',
        );
      }
    } else {
      SnackBarWidget.showSnackBar(
        'Transaksi Gagal',
        'Error: No image selected.',
        'err',
      );
    }
  }

  Future<XFile?> compressImage(File image) async {
    final compressedImagePath =
        '${path.dirname(image.path)}/compressed_${path.basename(image.path)}';

    var result = await FlutterImageCompress.compressAndGetFile(
      image.absolute.path,
      compressedImagePath,
      quality: 100, // Adjust the quality as needed
    );

    return result;
  }

  /// Send the image to the OCR API endpoint
  Future<void> sendImage(XFile image) async {
    var url = Uri.parse("${UrlApi.baseAPI}/upload/id-card");
    final request = http.MultipartRequest('POST', url);
    request.files.add(await http.MultipartFile.fromPath(
      'id_card',
      image.path,
      filename: path.basename(image.path),
    ));

    try {
      isLoading.value = true; // Start loading
      final response = await request.send();
      final responseData = await response.stream.bytesToString();

      if (response.statusCode < 300) {
        var res = json.decode(responseData);
        ocrResult.value = res["data"];
        update();
        List keys = ocrResult.keys.toList();
        if (ocrResult.isNotEmpty && keys.length >= 14) {
          Get.to(arguments: ocrResult, () => const OcrResultView());
        } else {
          SnackBarWidget.showSnackBar(
            'Transaksi Gagal',
            'Invalid ID Card data',
            'err',
          );
          isLoading.value = false;
        }
      } else {
        var errorMessage = json.decode(responseData);
        SnackBarWidget.showSnackBar(
          'Gagal mengirim gambar',
          'Error: ${errorMessage['error']}',
          'err',
        );
      }
    } catch (e) {
      SnackBarWidget.showSnackBar(
        'Transaksi Gagal',
        'Execption: $e',
        'err',
      );
    } finally {
      isLoading.value = false; // Stop loading
    }
  }
}
