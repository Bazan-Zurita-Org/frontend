import 'dart:io';

import 'package:dio/dio.dart';

abstract class ApiClientRepository {
  Future<Response> getData(String uri,
      {Map<String, dynamic>? query,
      Map<String, String>? headers,
      bool handleError = true});

  Future<Response> postData(
    String uri,
    dynamic body, {
    Map<String, String>? headers,
    int? timeout,
    bool handleError = true,
  });

  Future<Response> putData(
    String uri,
    dynamic body, {
    Map<String, String>? headers,
    bool handleError = true,
  });

  Future<Response> deleteData(
    String uri, {
    Map<String, String>? headers,
    bool handleError = true,
  });

  Future<Response> postMultipartData(
    String uri,
    Map<String, String> body,
    List<MultipartBody> multipartBody, {
    Map<String, String>? headers,
    bool handleError = true,
  });
}

class MultipartBody {
  String key;
  File? file;

  MultipartBody(this.key, this.file);
}
