import 'package:app_gym/core/usecase/use_case.dart';
import 'package:app_gym/features/auth/domain/repositories/auth_repository_interface.dart';

class GetSaveTokenUseCase
    implements UseCase<(String, String)?, (String email, String password)> {
  final AuthRepositoryInterface authRepositoryInterface;

  GetSaveTokenUseCase({required this.authRepositoryInterface});
  @override
  Future<(String, String)?> call(
      {(String email, String password)? params}) async {
    return await authRepositoryInterface.getAuthLoginUserEmail(
      email: params!.$1,
      password: params.$2,
    );
  }
}
