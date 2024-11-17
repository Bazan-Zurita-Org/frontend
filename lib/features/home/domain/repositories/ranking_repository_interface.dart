import 'package:app_gym/features/home/domain/entities/rankings_entity.dart';

abstract class RankingRepositoryInterface {
  Future<List<RanKingEntity>> getListRankingData();
}
