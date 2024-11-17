import 'package:app_gym/core/api/api_client_repository.dart';
import 'package:app_gym/core/helper/app_constants.dart';
import 'package:app_gym/features/auth/data/models/user_model.dart';
import 'package:app_gym/features/auth/domain/entities/user_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class AuthDatasourceRemote {
  Future<(String token, String id)?> authLoginWithEmail(
      {required String email, required String password});
  Future<String?> authRegisterWithEmail({required UserEntity userEntity});
  Future<List<dynamic>> getListUsersIdData();
}

class AuthDatasourceRemoteImpl implements AuthDatasourceRemote {
  final ApiClientRepository apiClientRepository;

  AuthDatasourceRemoteImpl({required this.apiClientRepository});
  @override
  Future<(String token, String id)?> authLoginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final data = await apiClientRepository.postData(
        AppConstants.login,
        {"email": email, "password": password},
      );
      debugPrint("data es $data");
      return switch (data.statusCode) {
        200 => (data.data['token'] as String, data.data['id'] as String),
        _ => null,
      };
    } catch (e) {
      debugPrint("el error es $e");
      return null;
    }
  }

  @override
  Future<String?> authRegisterWithEmail(
      {required UserEntity userEntity}) async {
    final tobody = UserModel.fromEntity(userEntity).toJson();
    debugPrint("el cuerpo es $tobody");
    try {
      final tobody = UserModel.fromEntity(userEntity).toJson();
      debugPrint("el cuerpo es $tobody");
      final data = await apiClientRepository.postData(
        AppConstants.register,
        tobody,
      );

      return switch (data.statusCode) {
        201 => data.data.toString(),
        _ => null,
      };
    } on DioException catch (e) {
      debugPrint("el error de registro es fsidufh $e");
      return null;
    }
  }

  @override
  Future<List> getListUsersIdData() async {
    try {
      final data = await apiClientRepository.getData(
        AppConstants.register,
      );
      if (data.statusCode == 200) {
        return (data.data as List<dynamic>);
      }
      return [];
    } catch (e) {
      debugPrint("El error es $e");
      return [];
    }
  }
}
