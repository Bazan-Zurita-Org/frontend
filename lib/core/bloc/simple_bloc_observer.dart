import 'package:app_gym/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    getIt<Logger>().t('${bloc.runtimeType} $error');
    super.onError(bloc, error, stackTrace);
  }
}
