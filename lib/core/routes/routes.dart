import 'package:app_gym/core/routes/auth/auth_routes.dart';
import 'package:app_gym/core/routes/bloc/routes_bloc.dart';
import 'package:app_gym/features/auth/presentation/pages/auth_page.dart';
import 'package:app_gym/features/auth/presentation/pages/register_step_1.dart';
import 'package:app_gym/features/auth/presentation/pages/register_step_2.dart';
import 'package:app_gym/features/home/domain/entities/rutina_entity.dart';
import 'package:app_gym/features/home/presentation/pages/home_page.dart';
import 'package:app_gym/features/home/presentation/pages/subpage/exersize_page.dart';
import 'package:app_gym/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const auth = "/auth";
  static const profile = "profile";
  static const register = "register-step1";
  static const register2 = "register-step2";
  static const home = "/home";
  static const exercise = "exersice";

  static GoRouter routerConfig(AuthStatus authStatus) => GoRouter(
        navigatorKey: onBoardingNavigatorKey,
        initialLocation: authStatus == AuthStatus.unauthenticated ? auth : home,
        routes: [
          AuthRoutes.authRoutes,
          GoRoute(
            path: Routes.home,
            pageBuilder: (context, state) => _materialView(
              state.pageKey,
              const HomePage(),
            ),
            routes: [
              GoRoute(
                path: Routes.exercise,
                name: Routes.exercise,
                pageBuilder: (context, state) => _materialView(
                  state.pageKey,
                  ExersizePage(
                    exerciseEntity: (state.extra as (
                      String name,
                      List<ExerciseEntity> listrutine
                    ))
                        .$2,
                    nameRutine: (state.extra as (
                      String name,
                      List<ExerciseEntity> listrutine
                    ))
                        .$1,
                  ),
                ),
              )
            ],
          )
        ],
      );

  static CustomTransitionPage Function(dynamic pagekey, Widget view)
      get materialPage => _materialView;

  static CustomTransitionPage _materialView(dynamic pagekey, Widget view) {
    return CustomTransitionPage(
      child: view,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }
}
