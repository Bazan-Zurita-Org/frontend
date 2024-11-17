part of 'routes_bloc.dart';

abstract class RoutesEvent extends Equatable {
  factory RoutesEvent.onGetAuthStatus() => _OnGetAuthStatus();

  @override
  List<Object> get props => [];
}

class _OnGetAuthStatus implements RoutesEvent {
  @override
  
  List<Object> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
