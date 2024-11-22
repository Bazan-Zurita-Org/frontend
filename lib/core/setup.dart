import 'package:app_gym/core/bloc/simple_bloc_observer.dart';
import 'package:app_gym/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.black, statusBarIconBrightness: Brightness.light));
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  Bloc.observer = SimpleBlocObserver();
}
