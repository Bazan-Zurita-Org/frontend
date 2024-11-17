import 'package:app_gym/core/helper/app_constants.dart';
import 'package:app_gym/core/helper/auth_status_convert.dart';
import 'package:app_gym/core/routes/bloc/routes_bloc.dart';
import 'package:app_gym/features/auth/data/datasources/auth_datasource_remote.dart';
import 'package:app_gym/features/auth/domain/entities/user_entity.dart';
import 'package:app_gym/features/auth/domain/repositories/auth_repository_interface.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl implements AuthRepositoryInterface {
  final AuthDatasourceRemote authDatasourceRemote;
  final SharedPreferences sharedPreferences;
  AuthRepositoryImpl(this.authDatasourceRemote, this.sharedPreferences);
  @override
  Future<(String, String)?> getAuthLoginUserEmail(
      {required String email, required String password}) async {
    try {
      final data = await authDatasourceRemote.authLoginWithEmail(
        email: email,
        password: password,
      );
      if (data != null) {
        await sharedPreferences.setString(AppConstants.token, data.$1);
        await sharedPreferences.setString(AppConstants.id, data.$2);
        await sharedPreferences.setString(
          AppConstants.authstatus,
          AuthStatus.authenticated.name,
        );
        return data;
      }
      return null;
    } on DioException catch (e) {
      debugPrint("el error es $e");
      return null;
    }
  }

  @override
  Future<String?> authRegisterUserEmail(
      {required UserEntity userEntity}) async {
    debugPrint("el user $userEntity");
    try {
      final data = await authDatasourceRemote.authRegisterWithEmail(
          userEntity: userEntity);
      if (data != null) {
        return data;
      }
      debugPrint("el resultado es $data");
      return null;
    } catch (e) {
      debugPrint("el error de regitro es $e");
      return null;
    }
  }

  @override
  Future<AuthStatus> authGetSaveAuthStatus() async {
    final data = converterString(
        sharedPreferences.getString(AppConstants.authstatus) ?? "");
    return data;
  }

  @override
  Future<void> authSaveAuthStatus({required String authStatus}) async {
    await sharedPreferences.setString(AppConstants.authstatus, authStatus);
  }

  @override
  Future<String?> getSaveIdUserData() async {
    return sharedPreferences.getString(AppConstants.id);
  }

  @override
  Future<List> getListUsersIdData() async {
    return await authDatasourceRemote.getListUsersIdData();
  }
}
