import 'package:get/get.dart';

import 'package:cakrawala_app/app/modules/ocr/controllers/ocr_result_controller.dart';

import '../controllers/ocr_controller.dart';

class OcrBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OcrResultController>(
      () => OcrResultController(),
    );
    Get.lazyPut<OcrController>(
      () => OcrController(),
    );
  }
}
