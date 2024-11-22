import 'package:app_gym/core/helper/app_constants.dart';
import 'package:app_gym/core/routes/bloc/routes_bloc.dart';
import 'package:app_gym/core/routes/routes.dart';
import 'package:app_gym/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:app_gym/features/home/presentation/bloc/duel_selector/duel_selected_cubit.dart';
import 'package:app_gym/features/home/presentation/bloc/home_bloc.dart';
import 'package:app_gym/injectable.dart';
import 'package:app_gym/injector_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final GlobalKey<NavigatorState> onBoardingNavigatorKey =
    GlobalKey<NavigatorState>();
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectorDependenCy();
  runApp(const MyProviders());
}

class MyProviders extends StatelessWidget {
  const MyProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RoutesBloc>(
          create: (context) => sl()..add(RoutesEvent.onGetAuthStatus()),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => sl()..add(AuthEvent.onGetIdSaveUserData()),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => sl(),
        ),
        BlocProvider<DuelCubit>(
          create: (context) => DuelCubit(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BlocBuilder<RoutesBloc, RoutesState>(
        builder: (context, stateroutes) {
          return ScreenUtilInit(
            designSize: const Size(360, 720),
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: AppConstants.appName,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              routerConfig: Routes.routerConfig(
                stateroutes.authStatus ?? AuthStatus.unauthenticated,
              ),
            ),
          );
        },
      );
    });
  }
}
