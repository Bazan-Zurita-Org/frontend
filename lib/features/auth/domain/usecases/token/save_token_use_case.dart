import 'package:app_gym/core/usecase/use_case.dart';
import 'package:app_gym/features/auth/domain/repositories/auth_repository_interface.dart';

class SaveTokenUseCase
    implements UseCase<void, (String email, String password)> {
  final AuthRepositoryInterface authRepositoryInterface;

  SaveTokenUseCase({required this.authRepositoryInterface});
  @override
  Future<void> call({(String email, String password)? params}) async {
    // return await authRepositoryInterface.getAuthLoginUserEmail(
    //   email: params!.$1,
    //   password: params.$2,
    // );
  }
}
