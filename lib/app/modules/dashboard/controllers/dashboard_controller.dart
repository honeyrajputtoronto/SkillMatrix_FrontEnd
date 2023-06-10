import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 5), () {
      isLoading.value = false;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void uploadData() async {}
}
