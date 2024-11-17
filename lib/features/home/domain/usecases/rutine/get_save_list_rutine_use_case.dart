import 'package:app_gym/core/usecase/use_case.dart';
import 'package:app_gym/features/home/domain/entities/rutina_entity.dart';
import 'package:app_gym/features/home/domain/repositories/rutine_repository_interface.dart';

class GetSaveListRutineUseCase implements UseCase<List<RutinaEntity>, void> {
  final RutineRepositoryInterface rutineRepositoryInterface;

  GetSaveListRutineUseCase({required this.rutineRepositoryInterface});
  @override
  Future<List<RutinaEntity>> call({void params}) async {
    return await rutineRepositoryInterface.getListRutineData();
  }
}
