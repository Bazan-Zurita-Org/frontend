import 'package:app_gym/core/usecase/use_case.dart';
import 'package:app_gym/features/auth/domain/repositories/auth_repository_interface.dart';

class GetListUserIdUseCase implements UseCase<List<dynamic>, void> {
  final AuthRepositoryInterface authRepositoryInterface;

  GetListUserIdUseCase({required this.authRepositoryInterface});
  @override
  Future<List> call({void params}) async {
    return await authRepositoryInterface.getListUsersIdData();
  }
}
