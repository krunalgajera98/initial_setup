import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:initial_setup/Utils/ApiNetwork/api_constants.dart';
import 'package:initial_setup/Utils/ApiNetwork/app_exception.dart';
import 'package:initial_setup/Utils/AppHelper/shared_preferences.dart';

class Api {
  static Api? _instance;

  static http.Client dio = http.Client();

  factory Api() {
    if (_instance == null) {
      _instance = Api._();
      return _instance!;
    } else {
      return _instance!;
    }
  }

  Api._();

  Future<dynamic> post(
    String url, {
    Map<String, dynamic>? queryData,
    dynamic bodyData,
  }) async {
    log('Post body: ${jsonEncode(bodyData)}');
    log('Post headers: ${headers()}');
    final response = await dio.post(
      getUrl(url, queryParameters: queryData),
      body: bodyData != null ? jsonEncode(bodyData) : null,
      headers: headers(),
    );
    return response;
  }

  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryData,
  }) async {
    log('Get headers: ${headers()}');
    final response = await dio.get(
      getUrl(url, queryParameters: queryData),
      headers: headers(),
    );
    return response;
  }

  Future<dynamic> put(
    String url, {
    Map<String, dynamic>? queryData,
    Map<String, dynamic>? bodyData,
  }) async {
    final response = await dio.put(
      getUrl(url, queryParameters: queryData),
      body: jsonEncode(bodyData),
      headers: headers(),
    );
    return response;
  }

  Future<dynamic> patch(
    String url, {
    Map<String, dynamic>? queryData,
    Map<String, dynamic>? bodyData,
  }) async {
    final response = await dio.patch(
      getUrl(url, queryParameters: queryData),
      body: jsonEncode(bodyData),
      headers: headers(),
    );
    return response;
  }

  Future<dynamic> delete(
    String url, {
    Map<String, dynamic>? queryData,
    Map<String, dynamic>? bodyData,
  }) async {
    final response = await dio.delete(
      getUrl(url, queryParameters: queryData),
      body: jsonEncode(bodyData),
      headers: headers(),
    );
    return response;
  }

  Future<dynamic> head(
    String url, {
    Map<String, dynamic>? queryData,
  }) async {
    final response = await dio.head(
      getUrl(url, queryParameters: queryData),
      headers: headers(),
    );
    return response;
  }

  Future<dynamic> multiPartRequest(
    String url, {
    Map<String, dynamic>? queryData,
    String path = '',
  }) async {
    var request = http.MultipartRequest('POST', Uri.parse('\${ApiConstants.BASE_URL}/common/uploadS3'));
    request.headers.addAll(headers());
    request.files.add(await http.MultipartFile.fromPath('file', path));
    http.StreamedResponse response = await request.send();
    var result = await http.Response.fromStream(response);
    return result;
  }

  Future<dynamic> multipartRequestList(String url,
      {required String key, Map<String, String>? body, List<String>? imageList}) async {
    try {
      String fullURL = 'BASE_URL + url';
      var request = http.MultipartRequest('POST', Uri.parse(fullURL));
      request.headers.addAll(headers());
      request.fields.addAll(body!);
      if (imageList != null && imageList.isNotEmpty) {
        imageList.forEach((element) async {
          request.files.add(await http.MultipartFile.fromPath(key, element));
        });
      }
      http.StreamedResponse response = await request.send();
      var result = await http.Response.fromStream(response);
      return result;
    } catch (exception) {
      AppException.showException(exception);
    }
  }
}

Map<String, String> headers() {
  final Map<String, String> headers = <String, String>{};
  headers["Content-Type"] = "application/json";
  headers["Accept"] = "application/json";
  String token = SharedPrefs.getString(key: PrefString.token);
  log('Authorization Token : ${token}');
  if (token != '') {
    headers["Authorization"] = 'Bearer ${token}';
    // headers["X-token"] = '$token';
  }
  return headers;
}

Uri getUrl(String endpoint, {Map<String, dynamic>? queryParameters}) {
  String url = "${ApiConstants.BASE_URL}$endpoint";
  if (queryParameters != null && queryParameters.isNotEmpty) {
    url = "$url?";
    for (int i = 0; i < queryParameters.entries.length; i++) {
      final element = queryParameters.entries.elementAt(i);
      url += '${element.key}=${element.value}';
      if (i < queryParameters.entries.length - 1) {
        url += '&';
      }
    }
  }
  log('Api Url: ${Uri.parse(url).toString()}');
  return Uri.parse(url);
}
