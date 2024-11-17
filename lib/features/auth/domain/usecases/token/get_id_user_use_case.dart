import 'package:app_gym/core/usecase/use_case.dart';
import 'package:app_gym/features/auth/domain/repositories/auth_repository_interface.dart';

class GetIdUserUseCase implements UseCase<String?, void> {
  final AuthRepositoryInterface authRepositoryInterface;

  GetIdUserUseCase({required this.authRepositoryInterface});
  @override
  Future<String?> call({void params}) async {
    return await authRepositoryInterface.getSaveIdUserData();
  }
}
