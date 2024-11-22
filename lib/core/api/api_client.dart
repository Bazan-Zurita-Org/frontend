import 'dart:convert';

import 'package:app_gym/core/api/api_client_repository.dart';
import 'package:app_gym/core/helper/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient implements ApiClientRepository {
  final SharedPreferences sharedPreferences;
  final String baseUrl;
  Dio dio;
  String? token;
  static const String noInternetMessage = 'connection_to_api_server_failed';
  final int timeoutInSeconds = 40;

  ApiClient({required this.baseUrl, required this.sharedPreferences})
      : dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 40),
          receiveTimeout: const Duration(seconds: 40),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        )) {
    token = sharedPreferences.getString(AppConstants.token);
    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
  }

  @override
  Future<Response> getData(String uri,
      {Map<String, dynamic>? query,
      Map<String, String>? headers,
      bool handleError = true}) async {
    try {
      final response = await dio.get(
        uri,
        queryParameters: query,
        options: Options(headers: headers ?? dio.options.headers),
      );
      return response;
    } catch (e) {
      return Response(
        requestOptions: RequestOptions(path: uri),
        statusCode: 500,
        data: e.toString(),
      );
    }
  }

  @override
  Future<Response> postData(String uri, body,
      {Map<String, String>? headers,
      int? timeout,
      bool handleError = true}) async {
    try {
      final response = await dio.post(
        uri,
        data: jsonEncode(body),
        options: Options(headers: headers ?? dio.options.headers),
      );
      return response;
    } catch (e) {
      return Response(
        requestOptions: RequestOptions(path: uri),
        statusCode: 500,
        data: e.toString(),
      );
    }
  }

  @override
  Future<Response> putData(String uri, body,
      {Map<String, String>? headers, bool handleError = true}) async {
    try {
      final response = await dio.put(
        uri,
        data: jsonEncode(body),
        options: Options(headers: headers ?? dio.options.headers),
      );
      return response;
    } catch (e) {
      return Response(
        requestOptions: RequestOptions(path: uri),
        statusCode: 500,
        data: e.toString(),
      );
    }
  }

  @override
  Future<Response> deleteData(String uri,
      {Map<String, String>? headers, bool handleError = true}) async {
    try {
      final response = await dio.delete(
        uri,
        options: Options(headers: headers ?? dio.options.headers),
      );
      return response;
    } catch (e) {
      return Response(
        requestOptions: RequestOptions(path: uri),
        statusCode: 500,
        data: e.toString(),
      );
    }
  }

  @override
  Future<Response> postMultipartData(
      String uri, Map<String, String> body, List<MultipartBody> multipartBody,
      {Map<String, String>? headers, bool handleError = true}) async {
    try {
      FormData formData = FormData.fromMap(body);
      for (MultipartBody multipart in multipartBody) {
        formData.files.add(
          MapEntry(
            multipart.key,
            await MultipartFile.fromFile(multipart.file!.path,
                filename: '${DateTime.now().toString()}.png'),
          ),
        );
      }

      final response = await dio.post(
        uri,
        data: formData,
        options: Options(headers: headers ?? dio.options.headers),
      );
      return response;
    } catch (e) {
      return Response(
          requestOptions: RequestOptions(path: uri),
          statusCode: 500,
          data: e.toString());
    }
  }
}
