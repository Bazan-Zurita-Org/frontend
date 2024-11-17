import 'package:app_gym/features/home/data/datasources/ranking_datasource_remote.dart';
import 'package:app_gym/features/home/domain/entities/rankings_entity.dart';
import 'package:app_gym/features/home/domain/repositories/ranking_repository_interface.dart';

class RankingRepositoryImpl implements RankingRepositoryInterface {
  final RankingDatasourceRemote rankingDatasourceRemote;

  RankingRepositoryImpl({required this.rankingDatasourceRemote});
  @override
  Future<List<RanKingEntity>> getListRankingData() async {
    return await rankingDatasourceRemote.getListRankingDataRemote();
  }
}
