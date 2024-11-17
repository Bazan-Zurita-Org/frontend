import 'package:app_gym/core/usecase/use_case.dart';
import 'package:app_gym/features/auth/domain/repositories/auth_repository_interface.dart';

class SaveAuthStatusUseCase implements UseCase<void, String> {
  final AuthRepositoryInterface authRepositoryInterface;

  SaveAuthStatusUseCase({required this.authRepositoryInterface});
  @override
  Future<void> call({String? params}) async {
    return await authRepositoryInterface.authSaveAuthStatus(
      authStatus: params!,
    );
  }
}
