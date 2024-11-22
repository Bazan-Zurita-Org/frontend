import 'dart:async';

import 'package:app_gym/core/helper/app_images.dart';
import 'package:app_gym/features/auth/presentation/pages/profile_user_page.dart';
import 'package:app_gym/features/home/domain/entities/challenges_entity.dart';
import 'package:app_gym/features/home/domain/entities/duels_entity.dart';
import 'package:app_gym/features/home/domain/entities/rankings_entity.dart';
import 'package:app_gym/features/home/domain/entities/rutina_entity.dart';
import 'package:app_gym/features/home/domain/usecases/challenges/assign_challenges_by_type_use_case.dart';
import 'package:app_gym/features/home/domain/usecases/challenges/challenges_complet_use_case.dart';
import 'package:app_gym/features/home/domain/usecases/challenges/get_save_list_challenges_use_case.dart';
import 'package:app_gym/features/home/domain/usecases/duels/get_save_list_duels_use_case.dart';
import 'package:app_gym/features/home/domain/usecases/rankig/get_save_list_ranking_use_case.dart';
import 'package:app_gym/features/home/domain/usecases/rutine/get_save_list_rutine_use_case.dart';
import 'package:app_gym/features/home/presentation/pages/subpage/duels_page.dart';
import 'package:app_gym/features/home/presentation/pages/subpage/my_diets_page.dart';
import 'package:app_gym/features/home/presentation/pages/subpage/rankings_page.dart';
import 'package:app_gym/features/home/presentation/pages/subpage/rutina_page.dart';
import 'package:app_gym/features/home/presentation/pages/subpage/weekly_challenge_page.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetSaveListRutineUseCase getSaveListRutineUseCase;
  final GetSaveListRankingUseCase getSaveListRankingUseCase;
  final GetSaveListChallengesUseCase getSaveListChallengesUseCase;
  final GetSaveListDuelsUseCase getSaveListDuelsUseCase;
  final AssignChallengesByTypeUseCase assignChallengesByTypeUseCase;
  final ChallengesCompletUseCase challengesCompletUseCase;
  HomeBloc(
    this.getSaveListRutineUseCase,
    this.getSaveListRankingUseCase,
    this.getSaveListChallengesUseCase,
    this.assignChallengesByTypeUseCase,
    this.getSaveListDuelsUseCase,
    this.challengesCompletUseCase,
  ) : super(HomeState.initialState()) {
    on<_OnChangedIndexPage>(_onChangedIndexPage);
    on<_OnGetListRutine>(_onGetListRutine);
    on<_OnGetListRanking>(_onGetListRanking);
    on<_OnGetListChallenges>(_onGetListChallenges);
    on<_OnGetListDuels>(_onGetListDuels);
    on<_OnAssignChallengesByType>(_onAssignChallengesByType);
    on<_OnChallengesComplet>(_onChallengesComplet);
  }

  List<PageModel> listpage = [
    PageModel(
        title: "Home",
        icons: const Icon(
          Icons.home,
          color: Colors.white,
        ),
        page: const RutinaPage()),
    PageModel(
      title: "My Workouts",
      icons: Image.asset(
        AppImages.workout,
        color: Colors.white,
      ),
      page: const WeeklyChallengePage(),
      // page: const WeeklyChallengePage(),
    ),
    PageModel(
      title: "Mis Dietas",
      icons: const Icon(Icons.health_and_safety, color: Colors.white),
      page: const MyDietsPage(),
    ),
    PageModel(
      title: "Rankings",
      icons: const Icon(
        Icons.sports_score_rounded,
        color: Colors.white,
      ),
      page: const RankingsPage(),
    ),
    PageModel(
      title: "Duelos",
      icons: const Icon(
        Icons.local_fire_department_outlined,
        color: Colors.white,
      ),
      page: const DuelsPage(),
    ),
  ];

  void _onChangedIndexPage(_OnChangedIndexPage event, Emitter<HomeState> emit) {
    emit(state.copyWith(indexpage: event.indexPage));
  }

  void _onGetListRutine(_OnGetListRutine event, Emitter<HomeState> emit) async {
    final data = await getSaveListRutineUseCase();
    emit(state.copyWith(listrutine: data));
  }

  void _onGetListRanking(
      _OnGetListRanking event, Emitter<HomeState> emit) async {
    final data = await getSaveListRankingUseCase();
    emit(state.copyWith(listranking: data));
  }

  void _onGetListChallenges(
      _OnGetListChallenges event, Emitter<HomeState> emit) async {
    final data = await getSaveListChallengesUseCase();
    emit(state.copyWith(listchallenges: data));
  }

  void _onAssignChallengesByType(
      _OnAssignChallengesByType event, Emitter<HomeState> emit) async {
    final data = await assignChallengesByTypeUseCase(
      params:
          ChallengeModi(type: event.type, body: event.body, group: event.group),
    );
    if (data != null) {
      emit(state.copyWith(
          assignChallengesStatus: AssignChallengesStatus.success));
    } else {
      emit(state.copyWith(
          assignChallengesStatus: AssignChallengesStatus.failed));
    }
    emit(state.copyWith(assignChallengesStatus: AssignChallengesStatus.init));
  }

  void _onGetListDuels(_OnGetListDuels event, Emitter<HomeState> emit) async {
    final data = await getSaveListDuelsUseCase();
    emit(state.copyWith(listduels: data));
  }

  void _onChallengesComplet(
      _OnChallengesComplet event, Emitter<HomeState> emit) async {
    await challengesCompletUseCase(params: event.id);
  }
}

class PageModel {
  final String title;
  final Widget icons;
  final Widget page;

  PageModel({required this.title, required this.icons, required this.page});
}
