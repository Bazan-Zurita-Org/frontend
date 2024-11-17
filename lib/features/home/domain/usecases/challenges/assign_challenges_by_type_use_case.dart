import 'package:app_gym/core/usecase/use_case.dart';
import 'package:app_gym/features/home/domain/repositories/challenges_repository_interface.dart';

class AssignChallengesByTypeUseCase implements UseCase<String?, ChallengeModi> {
  final ChallengesRepositoryInterface challengesRepositoryInterface;

  AssignChallengesByTypeUseCase({required this.challengesRepositoryInterface});

  @override
  Future<String?> call({ChallengeModi? params}) async {
    return await challengesRepositoryInterface.assingChallengeBytype(
      type: params!.type!,
      body: params.body,
      groud: params.group,
    );
  }
}

class ChallengeModi {
  final String? type;
  final (String, String)? body;
  final Map<String, dynamic>? group;

  ChallengeModi({required this.type, required this.body, required this.group});
}
