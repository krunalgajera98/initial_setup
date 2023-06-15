import 'package:get/get.dart';
import 'package:initial_setup/Screen/Home/view/home_screen.dart';
import 'package:initial_setup/Screen/Splash/view/splash_screen.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(
    name: SplashScreen.routeName,
    page: () => SplashScreen(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: HomePage.routeName,
    page: () => HomePage(),
    transition: Transition.fadeIn,
  ),
];
