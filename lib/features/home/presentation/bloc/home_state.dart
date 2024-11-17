part of 'home_bloc.dart';

enum AssignChallengesStatus { init, success, failed }

class HomeState extends Equatable {
  final int? indexpage;
  final List<RutinaEntity>? listrutine;
  final List<RanKingEntity>? listranking;
  final List<ChallengesEntity>? listchallenges;
  final AssignChallengesStatus? assignChallengesStatus;
  const HomeState({
    this.indexpage,
    this.listrutine,
    this.listranking,
    this.listchallenges,
    this.assignChallengesStatus,
  });

  factory HomeState.initialState() => const HomeState(
        indexpage: 0,
        listrutine: [],
        listranking: [],
        listchallenges: [],
        assignChallengesStatus: AssignChallengesStatus.init,
      );

  HomeState copyWith({
    int? indexpage,
    List<RutinaEntity>? listrutine,
    List<RanKingEntity>? listranking,
    List<ChallengesEntity>? listchallenges,
    AssignChallengesStatus? assignChallengesStatus,
  }) {
    return HomeState(
      indexpage: indexpage ?? this.indexpage,
      listrutine: listrutine ?? this.listrutine,
      listranking: listranking ?? this.listranking,
      listchallenges: listchallenges ?? this.listchallenges,
      assignChallengesStatus:
          assignChallengesStatus ?? this.assignChallengesStatus,
    );
  }

  @override
  List<Object?> get props => [
        indexpage,
        listrutine,
        listranking,
        listchallenges,
        assignChallengesStatus,
      ];
}
