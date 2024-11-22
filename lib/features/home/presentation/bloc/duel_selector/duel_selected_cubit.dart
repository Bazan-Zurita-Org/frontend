import 'package:flutter_bloc/flutter_bloc.dart';

class DuelCubit extends Cubit<String> {
  DuelCubit() : super('');

  void changeValue(String value) {
    if (state != value) {
      emit(value);
    }
  }
}
