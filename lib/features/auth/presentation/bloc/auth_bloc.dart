import 'dart:async';

import 'package:app_gym/core/routes/bloc/routes_bloc.dart';
import 'package:app_gym/features/auth/domain/entities/user_entity.dart';
import 'package:app_gym/features/auth/domain/usecases/authstatus/get_save_auth_status_use_case.dart';
import 'package:app_gym/features/auth/domain/usecases/authstatus/save_auth_status_use_case.dart';
import 'package:app_gym/features/auth/domain/usecases/token/get_id_user_use_case.dart';
import 'package:app_gym/features/auth/domain/usecases/token/get_save_token_use_case.dart';
import 'package:app_gym/features/auth/domain/usecases/token/save_token_use_case.dart';
import 'package:app_gym/features/auth/domain/usecases/user/get_save_user_use_case.dart';
import 'package:app_gym/features/auth/domain/usecases/user/save_user_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetSaveUserUseCase getSaveUserUseCase;
  final SaveUserUseCase saveUserUseCase;
  final GetSaveAuthStatusUseCase getSaveAuthStatusUseCase;
  final GetSaveTokenUseCase getSaveTokenUseCase;
  final SaveAuthStatusUseCase saveAuthStatusUseCase;
  final GetIdUserUseCase getIdUserUseCase;
  AuthBloc(
      this.saveUserUseCase,
      this.getSaveTokenUseCase,
      this.getSaveAuthStatusUseCase,
      this.saveAuthStatusUseCase,
      this.getIdUserUseCase,
      this.getSaveUserUseCase)
      : super(AuthState.initialState()) {
    on<_OnLoginWithEmail>(_onLoginWithEmail);
    on<_OnRegisterWithEmail>(_onRegisterWithEmail);
    on<_OnGetIdSaveUserData>(_onGetIdSaveUserData);
    on<_OnGetSaveUserData>(_onGetSaveUserData);
    on<_OnLogout>(_onLogout);
  }

  final name = TextEditingController();
  final lastname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phone = TextEditingController();
  final height = TextEditingController();
  final weight = TextEditingController();
  final genre = TextEditingController();
  final birthdate = TextEditingController();
  final physicalobjective = TextEditingController();
  final targetweight = TextEditingController();
  final loginkeyform = GlobalKey<FormState>();
  final registerkeyform = GlobalKey<FormState>();
  final register2keyform = GlobalKey<FormState>();

  void _onLogout(_OnLogout event, Emitter<AuthState> emit) async {
    emit(state.copyWith(
      loginStatus: LoginStatus.init,
      registerStatus: RegisterStatus.init,
    ));
  }

  void _onLoginWithEmail(
      _OnLoginWithEmail event, Emitter<AuthState> emit) async {
    try {
      final data =
          await getSaveTokenUseCase(params: (email.text, password.text));
      debugPrint("hola $data");
      if (data != null) {
        await saveAuthStatusUseCase(params: AuthStatus.authenticated.name);

        emit(state.copyWith(loginStatus: LoginStatus.success, idUser: data.$2));
        // disposeControllers();
        clearControllers();
      } else {
        emit(state.copyWith(loginStatus: LoginStatus.failed));
      }
      debugPrint("SB - El estado es ${state.loginStatus}");
      emit(state.copyWith(loginStatus: LoginStatus.init));
    } catch (e) {
      debugPrint("El error es $e");
      emit(state.copyWith(loginStatus: LoginStatus.failed));
    }
  }

  void _onRegisterWithEmail(
      _OnRegisterWithEmail event, Emitter<AuthState> emit) async {
    final data = await saveUserUseCase(
      params: UserEntity(
        firstName: name.text,
        lastName: lastname.text,
        email: email.text,
        password: password.text,
        height: double.tryParse(height.text),
        weight: double.tryParse(weight.text),
        gender: genre.text,
        dateOfBirth: _parseDate(birthdate.text),
        phone: phone.text,
        fitnessGoal: physicalobjective.text,
        targetWeigth: double.tryParse(targetweight.text),
        points: 0,
      ),
    );
    if (data != null) {
      emit(state.copyWith(registerStatus: RegisterStatus.success));
    } else {
      emit(state.copyWith(registerStatus: RegisterStatus.failed));
    }
    clearControllers();
    // disposeControllers();
    emit(state.copyWith(registerStatus: RegisterStatus.init));
  }

  DateTime? _parseDate(String date) {
    try {
      // Define el formato de tu fecha (dd - MM - yyyy)
      final DateFormat formatter = DateFormat('dd - MM - yyyy');
      return formatter.parse(date);
    } catch (e) {
      debugPrint("Error al parsear la fecha: $e");
      return null;
    }
  }

  void clearControllers() {
    name.clear();
    lastname.clear();
    email.clear();
    password.clear();
    phone.clear();
    height.clear();
    weight.clear();
    genre.clear();
    birthdate.clear();
    physicalobjective.clear();
    targetweight.clear();
  }

// Método dispose para liberar recursos
  void disposeControllers() {
    name.dispose();
    lastname.dispose();
    email.dispose();
    password.dispose();
    phone.dispose();
    height.dispose();
    weight.dispose();
    genre.dispose();
    birthdate.dispose();
    physicalobjective.dispose();
    targetweight.dispose();
    // loginkeyform.currentState?.dispose();
    // registerkeyform.currentState?.dispose();
    // register2keyform.currentState?.dispose();
  }

  void _onGetIdSaveUserData(
      _OnGetIdSaveUserData event, Emitter<AuthState> emit) async {
    final data = await getIdUserUseCase();
    emit(state.copyWith(idUser: data));
  }

  void _onGetSaveUserData(
      _OnGetSaveUserData event, Emitter<AuthState> emit) async {
    final data = await getSaveUserUseCase();
    emit(state.copyWith(userEntity: data));
  }
}
