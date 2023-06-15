import 'dart:convert';
import 'dart:developer';

import 'package:initial_setup/Utils/ApiNetwork/api.dart';
import 'package:initial_setup/Utils/ApiNetwork/api_constants.dart';
import 'package:initial_setup/Utils/ApiNetwork/check_response.dart';


class HomeService{
  static Future<dynamic> testApi({required Map<String, dynamic> body}) async {
    try {
      var result = await Api().post(ApiConstants.signIn, bodyData: body);
      log("testApi status: ${result.statusCode} body:${result.body}");
      await ResponseHandler.checkResponseError(result);
      // return TestModel.fromJson(jsonDecode(result.body));
    } catch (e, st) {
      log("testApi catchBloc error: $e && st: $st");
      rethrow;
    }
  }
}