import 'package:app_gym/core/usecase/use_case.dart';
import 'package:app_gym/features/home/domain/entities/rankings_entity.dart';
import 'package:app_gym/features/home/domain/repositories/ranking_repository_interface.dart';

class GetSaveListRankingUseCase implements UseCase<List<RanKingEntity>, void> {
  final RankingRepositoryInterface rankingRepositoryInterface;

  GetSaveListRankingUseCase({required this.rankingRepositoryInterface});
  @override
  Future<List<RanKingEntity>> call({void params}) async {
    return await rankingRepositoryInterface.getListRankingData();
  }
}
