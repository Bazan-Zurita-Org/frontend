import 'package:app_gym/core/routes/bloc/routes_bloc.dart';

AuthStatus converterString(String enumStatus) {
  return switch (enumStatus) {
    'authenticated' => AuthStatus.authenticated,
    'unauthenticated' => AuthStatus.unauthenticated,
    'authenticatedFailed' => AuthStatus.authenticatedFailed,
    'authenticating' => AuthStatus.authenticating,
    'logOut' => AuthStatus.logOut,
    _ => AuthStatus.unauthenticated,
  };
}
