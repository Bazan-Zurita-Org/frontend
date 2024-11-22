part of 'routes_bloc.dart';

abstract class RoutesEvent extends Equatable {
  factory RoutesEvent.onGetAuthStatus() => _OnGetAuthStatus();
  factory RoutesEvent.onLogout() => _OnLogout();

  @override
  List<Object> get props => [];
}

class _OnLogout implements RoutesEvent {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => throw UnimplementedError();
}

class _OnGetAuthStatus implements RoutesEvent {
  @override
  List<Object> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
