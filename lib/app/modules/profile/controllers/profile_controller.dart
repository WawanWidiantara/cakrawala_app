import 'package:cakrawala_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  final box = GetStorage();
  var userDetails = {}.obs;

  final count = 0.obs;
  @override
  void onInit() {
    var user = box.read('user_details');
    userDetails.value = user;
    update();
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

  void logout() {
    box.erase();
    Get.offAllNamed(Routes.ON_BOARDING);
  }
}
