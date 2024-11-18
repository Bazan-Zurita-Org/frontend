import 'package:app_gym/features/home/data/datasources/challenges_datasource_remote.dart';
import 'package:app_gym/features/home/domain/entities/challenges_entity.dart';
import 'package:app_gym/features/home/domain/repositories/challenges_repository_interface.dart';

class ChallengesRepositoryImpl implements ChallengesRepositoryInterface {
  final ChallengesDatasourceRemote challengesDatasourceRemote;

  ChallengesRepositoryImpl({required this.challengesDatasourceRemote});
  @override
  Future<List<ChallengesEntity>> getListChallengesData() async {
    return await challengesDatasourceRemote.getListChallengesRemoteData();
  }

  @override
  Future<String?> assingChallengeBytype(
      {required String type,
      required (String, String)? body,
      required Map<String, dynamic>? groud}) async {
    return await challengesDatasourceRemote.assigChallengByType(
      type: type,
      body: body,
      groud: groud,
    );
  }

  @override
  Future<void> challengesComplet(String id) async {
    return await challengesDatasourceRemote.challengesComplet(id);
  }
}
