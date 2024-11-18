part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  factory AuthEvent.onLoginWithEmail() => _OnLoginWithEmail();
  factory AuthEvent.onRegisterWithEmail() => _OnRegisterWithEmail();
  factory AuthEvent.onGetIdSaveUserData() => _OnGetIdSaveUserData();
  factory AuthEvent.onGetSaveUserData() => _OnGetSaveUserData();

  @override
  List<Object?> get props => [];
}

class _OnGetSaveUserData implements AuthEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}

class _OnGetIdSaveUserData implements AuthEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}

class _OnRegisterWithEmail implements AuthEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}

class _OnLoginWithEmail implements AuthEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
