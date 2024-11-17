import 'package:app_gym/core/usecase/use_case.dart';
import 'package:app_gym/features/auth/domain/entities/user_entity.dart';
import 'package:app_gym/features/auth/domain/repositories/auth_repository_interface.dart';

class SaveUserUseCase implements UseCase<String?, UserEntity> {
  final AuthRepositoryInterface authRepositoryInterface;

  SaveUserUseCase({required this.authRepositoryInterface});
  @override
  Future<String?> call({UserEntity? params}) async {
    return await authRepositoryInterface.authRegisterUserEmail(
      userEntity: params!,
    );
  }
}
