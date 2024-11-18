part of 'home_bloc.dart';

enum AssignChallengesStatus { init, success, failed }

class HomeState extends Equatable {
  final int? indexpage;
  final List<RutinaEntity>? listrutine;
  final List<RanKingEntity>? listranking;
  final List<ChallengesEntity>? listchallenges;
  final List<DuelsEntity>? listduels;
  final AssignChallengesStatus? assignChallengesStatus;
  const HomeState({
    this.indexpage,
    this.listrutine,
    this.listranking,
    this.listchallenges,
    this.listduels,
    this.assignChallengesStatus,
  });

  factory HomeState.initialState() => const HomeState(
        indexpage: 0,
        listrutine: [],
        listranking: [],
        listchallenges: [],
        listduels: [],
        assignChallengesStatus: AssignChallengesStatus.init,
      );

  HomeState copyWith({
    int? indexpage,
    List<RutinaEntity>? listrutine,
    List<RanKingEntity>? listranking,
    List<ChallengesEntity>? listchallenges,
    List<DuelsEntity>? listduels,
    AssignChallengesStatus? assignChallengesStatus,
  }) {
    return HomeState(
      indexpage: indexpage ?? this.indexpage,
      listrutine: listrutine ?? this.listrutine,
      listranking: listranking ?? this.listranking,
      listchallenges: listchallenges ?? this.listchallenges,
      listduels: listduels ?? this.listduels,
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
        listduels,
      ];
}
