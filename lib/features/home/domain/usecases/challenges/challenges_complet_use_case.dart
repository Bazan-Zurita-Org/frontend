import 'package:app_gym/core/usecase/use_case.dart';
import 'package:app_gym/features/home/domain/repositories/challenges_repository_interface.dart';

class ChallengesCompletUseCase implements UseCase<void, String> {
  final ChallengesRepositoryInterface challengesRepositoryInterface;

  ChallengesCompletUseCase({required this.challengesRepositoryInterface});
  @override
  Future<void> call({String? params}) async {
    return await challengesRepositoryInterface.challengesComplet(params!);
  }
}
