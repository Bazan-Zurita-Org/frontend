import 'package:app_gym/core/routes/bloc/routes_bloc.dart';
import 'package:app_gym/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepositoryInterface {
  Future<(String, String)?> getAuthLoginUserEmail(
      {required String email, required String password});
  Future<String?> authRegisterUserEmail({required UserEntity userEntity});
  Future<AuthStatus> authGetSaveAuthStatus();
  Future<void> authSaveAuthStatus({required String authStatus});
  Future<String?> getSaveIdUserData();
  Future<List<dynamic>> getListUsersIdData();
  Future<UserEntity?> getSaveUserData();
}
