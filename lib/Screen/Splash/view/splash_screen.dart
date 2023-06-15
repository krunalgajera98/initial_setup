import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:initial_setup/Screen/Splash/controller/splash_controller.dart';
import 'package:initial_setup/Utils/AppHelper/size_helper.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/SplashScreen';

  SplashScreen({Key? key}) : super(key: key);

  SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'Splash Screen',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    ).beResponsive;
  }
}
