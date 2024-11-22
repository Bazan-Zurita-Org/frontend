import 'package:app_gym/features/shared/domain/entity/dropdown_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'duel_selector_form_state.freezed.dart';

@freezed
class DuelSelectorFormState with _$DuelSelectorFormState {
  const DuelSelectorFormState._();

  factory DuelSelectorFormState({
    @Default([]) List<dynamic> duels,
    dynamic? duelSelected,
  }) = _DuelSelectorFormState;

  List<DropdownEntity> get duelsDrops {
    return duels.map((e) => DropdownEntity(e['id'], e['name'])).toList();
  }

  DropdownEntity? get duelDropSelected => duelSelected?.toDropdownEntity();

  bool get isFormValid => duelSelected != null;
}
