import 'dart:async';

import 'package:app_gym/features/home/domain/entities/challenges_entity.dart';
import 'package:app_gym/features/home/domain/entities/rankings_entity.dart';
import 'package:app_gym/features/home/domain/entities/rutina_entity.dart';
import 'package:app_gym/features/home/domain/usecases/challenges/assign_challenges_by_type_use_case.dart';
import 'package:app_gym/features/home/domain/usecases/challenges/get_save_list_challenges_use_case.dart';
import 'package:app_gym/features/home/domain/usecases/rankig/get_save_list_ranking_use_case.dart';
import 'package:app_gym/features/home/domain/usecases/rutine/get_save_list_rutine_use_case.dart';
import 'package:app_gym/features/home/presentation/pages/subpage/duels_page.dart';
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
  final AssignChallengesByTypeUseCase assignChallengesByTypeUseCase;
  HomeBloc(
    this.getSaveListRutineUseCase,
    this.getSaveListRankingUseCase,
    this.getSaveListChallengesUseCase,
    this.assignChallengesByTypeUseCase,
  ) : super(HomeState.initialState()) {
    on<_OnChangedIndexPage>(_onChangedIndexPage);
    on<_OnGetListRutine>(_onGetListRutine);
    on<_OnGetListRanking>(_onGetListRanking);
    on<_OnGetListChallenges>(_onGetListChallenges);
    on<_OnAssignChallengesByType>(_onAssignChallengesByType);
  }

  List<Widget> listpage = [
    const RutinaPage(),
    const RankingsPage(),
    const WeeklyChallengePage(),
    const DuelsPage()
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
}
