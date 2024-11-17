import 'package:app_gym/features/home/domain/entities/challenges_entity.dart';

abstract class ChallengesRepositoryInterface {
  Future<List<ChallengesEntity>> getListChallengesData();
  Future<String?> assingChallengeBytype(
      {required String type,
      required (String traineeld, String challengeId)? body,
      required Map<String, dynamic>? groud});
}
