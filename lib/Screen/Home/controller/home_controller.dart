import 'dart:developer';
import 'package:get/get.dart';
import 'package:initial_setup/Screen/Home/service/home_service.dart';
import 'package:initial_setup/Utils/ApiNetwork/ApiResponse.dart';

class HomeController extends GetxController {
  // Rx<ApiResponse<TestModel>> testModel = ApiResponse<TestModel>().obs;
  Rx<ApiResponse<dynamic>> testModel = ApiResponse<dynamic>().obs;

  Future<void> testApi({required String id}) async {
    try {
      testModel.value = ApiResponse.loading();
      dynamic res = await HomeService.testApi(body: {});
      testModel.value = ApiResponse.completed(res);
      log("Response 00: ${testModel.value.res?.toString()}");
    } catch (e, st) {
      log("testApi error : $e && $st");
      testModel.value = ApiResponse.error('error message');
    }
  }
}
