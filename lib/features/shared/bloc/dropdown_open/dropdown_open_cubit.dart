import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class DropdownOpenCubit extends Cubit<bool> {
  DropdownOpenCubit() : super(false);

  void changeOpen(bool value) {
    if (state != value) {
      emit(value);
    }
  }
}
