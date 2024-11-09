import 'package:get/get.dart';
import 'package:newsapp/controller/home_controller.dart';

class DependendcyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
