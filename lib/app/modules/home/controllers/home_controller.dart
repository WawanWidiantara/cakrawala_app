import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final getStorage = GetStorage();
  var user = {}.obs;

  final count = 0.obs;
  @override
  void onInit() {
    final userData = getStorage.read('user_details');
    user.value = userData;
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
