import 'dart:convert';
import 'dart:io';
import 'package:cakrawala_app/app/modules/ocr/views/ocr_result_view.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class OcrController extends GetxController {
  //TODO: Implement OcrController
  var selectedImage = ''.obs;
  File? receiptImage;
  var ktpResult = {}.obs;

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
      File receiptImage = File(pickedFile.path);
      selectedImage.value = pickedFile.path.toString();
      ktpResult.clear();
      Get.to(arguments: ktpResult, () => const OcrResultView());
    } else {
      print('No image selected.');
    }
  }

//  Future<void> sendImage(File image) async {
//     var url = Uri.parse("${UrlApi.baseAPI}/extract/");
//     var token = 'Bearer ${loginController.getStorage.read("access_token")}';

//     final request = http.MultipartRequest('POST', url);
//     request.headers['Authorization'] = token;

//     request.files.add(await http.MultipartFile.fromPath(
//       'file',
//       image.path,
//       filename: path.basename(image.path),
//     ));

//     try {
//       final response = await request.send();

//       if (response.statusCode == 200) {
//         final responseData = await response.stream.bytesToString();
//         print('Success: $responseData');
//         var res = json.decode(responseData);
//         nerResult.value = res;
//         update();
//       } else {
//         print('Failed: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
}
