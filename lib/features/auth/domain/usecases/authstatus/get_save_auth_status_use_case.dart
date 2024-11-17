import 'package:app_gym/core/routes/bloc/routes_bloc.dart';
import 'package:app_gym/core/usecase/use_case.dart';
import 'package:app_gym/features/auth/domain/repositories/auth_repository_interface.dart';

class GetSaveAuthStatusUseCase implements UseCase<AuthStatus, void> {
  final AuthRepositoryInterface authRepositoryInterface;

  GetSaveAuthStatusUseCase({required this.authRepositoryInterface});
  @override
  Future<AuthStatus> call({void params}) async {
    return await authRepositoryInterface.authGetSaveAuthStatus();
  }
}
