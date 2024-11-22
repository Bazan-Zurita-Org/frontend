import 'package:freezed_annotation/freezed_annotation.dart';

part 'diet_event.freezed.dart';

@freezed
class DietEvent with _$DietEvent {
  const factory DietEvent.doGetDiets() = DoGetDiets;
}
