import 'package:app_gym/core/usecase/use_case.dart';
import 'package:app_gym/features/home/domain/entities/duels_entity.dart';
import 'package:app_gym/features/home/domain/repositories/duels_repository_interface.dart';

class GetSaveListDuelsUseCase implements UseCase<List<DuelsEntity>, void> {
  final DuelsRepositoryInterface duelsRepositoryInterface;

  GetSaveListDuelsUseCase({required this.duelsRepositoryInterface});
  @override
  Future<List<DuelsEntity>> call({void params}) async {
    return await duelsRepositoryInterface.getListDuelsData();
  }
}
