import 'package:get/get.dart';

class FavoriteController extends GetxController {
  //TODO: Implement FavoriteController

  final count = 0.obs;
  var favorites = List<bool>.generate(5, (_) => false).obs;

  // Toggle favorite status for a specific index

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
  // Toggle favorite status
  void toggleFavorite(int index) {
    favorites[index] = !favorites[index];
  }
}
