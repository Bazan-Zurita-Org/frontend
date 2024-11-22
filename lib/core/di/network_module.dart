import 'dart:convert';
import 'dart:developer';

import 'package:app_gym/core/helper/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio(Interceptor interceptor) {
    var dio = Dio(BaseOptions(
        connectTimeout: const Duration(seconds: 40),
        receiveTimeout: const Duration(seconds: 40)));
    dio.interceptors.add(interceptor);
    return dio;
  }

  @Named('dio_non_interceptor')
  @lazySingleton
  Dio dioNonInterceptor() {
    var dio = Dio(BaseOptions(
        connectTimeout: const Duration(seconds: 40),
        receiveTimeout: const Duration(seconds: 40)));
    return dio;
  }

  @lazySingleton
  Interceptor interceptor(
    Logger logger,
  ) {
    return InterceptorsWrapper(onRequest: (options, handler) {
      options.contentType = Headers.jsonContentType;
      return handler.next(options);
    }, onResponse: (options, handler) async {
      var body = const JsonEncoder.withIndent('  ').convert(options.data);
      //logger.i('RESPONSE: $body');

      var headers = options.requestOptions.headers.toString();
      var url = options.requestOptions.baseUrl + options.requestOptions.path;
      var params = options.requestOptions.queryParameters;
      var requestBody = options.requestOptions.data != null
          ? const JsonEncoder.withIndent('  ')
              .convert(options.requestOptions.data)
          : null;

      logger.i(
          'SUCCESS(${options.statusCode ?? 0}): $url \n${headers.isNotEmpty && headers != '{}' ? 'HEADERS: \n$headers' : ''} \n${params.isNotEmpty && params != '{}' ? 'PARAMS: \n$params' : ''} \n${requestBody != null && requestBody.isNotEmpty && requestBody != '{}' ? 'BODY: \n$requestBody' : ''} \n${'RESPONSE: \n$body'}');

      return handler.next(options);
    }, onError: (error, handler) async {
      logger.i('ERROR: ${error.response?.data?.toString()}');

      var message = error.response?.data is Map
          ? error.response?.data['message']?.toString() ?? 'Unknown Error'
          : 'Unknown Error';
      var headers = error.requestOptions.headers.toString();
      var url = error.requestOptions.baseUrl + error.requestOptions.path;

      var params = error.requestOptions.queryParameters;
      var requestBody = error.requestOptions.data != null
          ? const JsonEncoder.withIndent('  ')
              .convert(error.requestOptions.data)
          : null;

      logger.i(
          'ERROR(${error.response?.statusCode ?? 0}): $url \n${headers.isNotEmpty && headers != '{}' ? 'HEADERS: \n$headers' : ''} \n${params.isNotEmpty && params != '{}' ? 'PARAMS: \n$params' : ''} \n${requestBody != null && requestBody.isNotEmpty && requestBody != '{}' ? 'BODY: \n$requestBody' : ''} \n${'ERROR: \n${error.response?.data?.toString()}'}');
      log('ERROR(${error.response?.statusCode ?? 0}): $url \n${headers.isNotEmpty && headers != '{}' ? 'HEADERS: \n$headers' : ''} \n${params.isNotEmpty && params != '{}' ? 'PARAMS: \n$params' : ''} \n${requestBody != null && requestBody.isNotEmpty && requestBody != '{}' ? 'BODY: \n$requestBody' : ''} \n${'ERROR: \n${error.response?.data?.toString()}'}');

      return handler.next(error);
    });
  }

  @Named('api_domain')
  String loginDomain() {
    return AppConstants.baseUrl;
  }

  @Named('other_domain')
  String otherDomain() {
    return AppConstants.baseUrl;
  }
}
