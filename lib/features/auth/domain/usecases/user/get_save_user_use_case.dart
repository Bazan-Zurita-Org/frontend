import 'package:app_gym/core/usecase/use_case.dart';
import 'package:app_gym/features/auth/domain/entities/user_entity.dart';
import 'package:app_gym/features/auth/domain/repositories/auth_repository_interface.dart';

class GetSaveUserUseCase implements UseCase<UserEntity?, void> {
  final AuthRepositoryInterface authRepositoryInterface;

  GetSaveUserUseCase({required this.authRepositoryInterface});
  @override
  Future<UserEntity?> call({void params}) async {
    return await authRepositoryInterface.getSaveUserData();
  }
}
