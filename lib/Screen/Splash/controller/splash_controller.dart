import 'dart:async';
import 'package:get/get.dart';
import 'package:initial_setup/Screen/Home/view/home_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    getRoutes();
    super.onInit();
  }

  void getRoutes() async {
    Future.delayed(Duration(seconds: 3), () => Get.offAndToNamed(HomePage.routeName));
  }
}
