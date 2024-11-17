part of 'routes_bloc.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
  authenticatedFailed,
  authenticating,
  logOut,
}

class RoutesState extends Equatable {
  final AuthStatus? authStatus;
  const RoutesState({this.authStatus});

  factory RoutesState.initialState() => const RoutesState();

  RoutesState copyWith({AuthStatus? authStatus}) {
    return RoutesState(authStatus: authStatus ?? this.authStatus);
  }

  @override
  List<Object?> get props => [authStatus];
}
