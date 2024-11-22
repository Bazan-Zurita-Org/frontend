import 'package:app_gym/features/home/presentation/bloc/duel_form/duel_selector_form_state.dart';
import 'package:app_gym/features/shared/domain/entity/dropdown_entity.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DuelSelectorFormCubit extends Cubit<DuelSelectorFormState> {
  DuelSelectorFormCubit(super.initialState);

  void loadDuels(List<Map<String, dynamic>> duels) {
    if (state.duels.isEmpty) {
      emit(state.copyWith(duels: duels));
    }
  }

  void changeDuel(DropdownEntity dropdownEntity) async {
    var duelSelected = state.duels
        .firstWhereOrNull((e) => e.codeDuel.toString() == dropdownEntity.id);
    emit(state.copyWith(duelSelected: duelSelected));
  }
}
