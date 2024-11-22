import 'package:dartz/dartz.dart';
import 'package:app_gym/core/use_case_base.dart';
import 'package:app_gym/features/home/domain/entities/diet_entity.dart';
import 'package:app_gym/features/home/domain/repositories/diet_repository_interface.dart';

class GetSaveListDietsUseCase
    extends UseCase<Either<String, List<DietEntity>>, NoParams> {
  final DietRepositoryInterface dietRepositoryInterface;

  GetSaveListDietsUseCase(this.dietRepositoryInterface);

  @override
  Future<Either<String, List<DietEntity>>> call(
      [NoParams? params = const NoParams()]) async {
    try {
      final result = await dietRepositoryInterface.getDietList();
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
