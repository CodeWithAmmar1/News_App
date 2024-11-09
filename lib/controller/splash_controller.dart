import 'package:get/get.dart';
import 'package:newsapp/views/homepage.dart';

class AboutController extends GetxController {
  RxBool showLottie = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(seconds: 2), () {
      showLottie.value = true;

      Future.delayed(const Duration(seconds: 4), () {
        Get.off(() => Homepage());
      });
    });
  }
}
