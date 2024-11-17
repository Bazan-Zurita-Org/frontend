import 'dart:async';

import 'package:app_gym/features/auth/domain/usecases/authstatus/get_save_auth_status_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'routes_event.dart';
part 'routes_state.dart';

class RoutesBloc extends Bloc<RoutesEvent, RoutesState> {
  final GetSaveAuthStatusUseCase getSaveAuthStatusUseCase;
  RoutesBloc(this.getSaveAuthStatusUseCase)
      : super(RoutesState.initialState()) {
    on<_OnGetAuthStatus>(_onGetAuthStatus);
  }

  void _onGetAuthStatus(
      _OnGetAuthStatus event, Emitter<RoutesState> emit) async {
    final authstatus = await getSaveAuthStatusUseCase();
    emit(state.copyWith(authStatus: authstatus));
  }
}
