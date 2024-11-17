part of 'auth_bloc.dart';

enum LoginStatus { init, success, failed }

enum RegisterStatus { init, success, failed }

class AuthState extends Equatable {
  final LoginStatus? loginStatus;
  final RegisterStatus? registerStatus;
  final String? idUser;
  const AuthState({this.loginStatus, this.registerStatus, this.idUser});

  factory AuthState.initialState() => const AuthState(
        loginStatus: LoginStatus.init,
        registerStatus: RegisterStatus.init,
      );

  AuthState copyWith({
    LoginStatus? loginStatus,
    RegisterStatus? registerStatus,
    String? idUser,
  }) {
    return AuthState(
      loginStatus: loginStatus ?? this.loginStatus,
      registerStatus: registerStatus ?? this.registerStatus,
      idUser: idUser ?? this.idUser,
    );
  }

  @override
  List<Object?> get props => [loginStatus, registerStatus, idUser];
}
