import 'package:app_gym/core/usecase/use_case.dart';
import 'package:app_gym/features/home/domain/entities/challenges_entity.dart';
import 'package:app_gym/features/home/domain/repositories/challenges_repository_interface.dart';

class GetSaveListChallengesUseCase
    implements UseCase<List<ChallengesEntity>, void> {
  final ChallengesRepositoryInterface challengesRepositoryInterface;

  GetSaveListChallengesUseCase({required this.challengesRepositoryInterface});
  @override
  Future<List<ChallengesEntity>> call({void params}) async {
    return await challengesRepositoryInterface.getListChallengesData();
  }
}
