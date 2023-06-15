import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:initial_setup/Utils/ApiNetwork/app_exception.dart';
import 'package:initial_setup/Utils/ApiNetwork/error_response.dart';
import 'package:initial_setup/Utils/AppFunction/app_function.dart';

class ResponseHandler {
  static Future<void> checkResponseError(http.Response response, {bool showException = true}) async {
    switch (response.statusCode) {
      case 200:
        if (response.body.isEmpty) {
          var exception = AppException(
            message: "Empty Body",
            errorCode: response.statusCode,
          );
          throw exception;
        }
        return;
      case 201:
        return;
      case 401:
        print('checkResponseError 401: ${response.body.toString()}');
        // if (Get.currentRoute != Routes.SPLASH_SCREEN) {
        //   await SharedPrefs.clear();
        //   Get.offAllNamed(Routes.SPLASH_SCREEN);
        // }
        var exception = AppException(
          message: "Unauthorized",
          errorCode: response.statusCode,
        );
        Map? data = response.body.isNotEmpty ? jsonDecode(response.body) : {};
        if (showException) {
          AppFunction.showSnackBar(
              title: 'Error!', message: (data?.isNotEmpty ?? false) ? data!['message'] : "Unauthorized");
        }
        throw exception;
      case 500:
        print('checkResponseError 500: ${response.body.toString()}');
        Map? data = response.body.isNotEmpty ? jsonDecode(response.body) : {};
        if (showException) {
          AppFunction.showSnackBar(
              title: 'Error!', message: (data?.isNotEmpty ?? false) ? data!['error'] : 'Internal Server Error..!');
        }
        print('checkResponseError 01');
        var exception = AppException(
          message: "Internal Server Error..!",
          errorCode: response.statusCode,
        );
        throw exception;
      default:
        print('checkResponseError default: ${response.body.toString()}');
        ErrorResponse error = ErrorResponse.fromJson(jsonDecode(response.body));
        if (showException) {
          AppFunction.showSnackBar(
              title: 'Error!', message: error.message ?? error.erroMessage ?? error.error ?? 'Something went wrong..!');
        }
        var exception = AppException(
          message: error.erroMessage ?? "Something went wrong..!",
          errorCode: response.statusCode,
        );
        if (showException) exception.show();
        throw 'exception';
    }
  }
}
