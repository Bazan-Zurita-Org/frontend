// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'diet_model.freezed.dart';
part 'diet_model.g.dart';

@freezed
class Calories with _$Calories {
  const factory Calories({
    @Default(0) int min,
    @Default(0) int max,
  }) = _Calories;

  factory Calories.fromJson(Map<String, dynamic> json) =>
      _$CaloriesFromJson(json);
}

@freezed
class Protein with _$Protein {
  const factory Protein({
    @Default(0) int min,
    @Default(0) int max,
  }) = _Protein;

  factory Protein.fromJson(Map<String, dynamic> json) =>
      _$ProteinFromJson(json);
}

@freezed
class Carbohydrate with _$Carbohydrate {
  const factory Carbohydrate({
    @Default(0) int min,
    @Default(0) int max,
  }) = _Carbohydrate;

  factory Carbohydrate.fromJson(Map<String, dynamic> json) =>
      _$CarbohydrateFromJson(json);
}

@freezed
class Fat with _$Fat {
  const factory Fat({
    @Default(0) int min,
    @Default(0) int max,
  }) = _Fat;

  factory Fat.fromJson(Map<String, dynamic> json) => _$FatFromJson(json);
}

@freezed
class Macronutrients with _$Macronutrients {
  const factory Macronutrients({
    @Default(0) int protein,
    @Default(0) int carbohydrates,
    @Default(0) int fat,
  }) = _Macronutrients;

  factory Macronutrients.fromJson(Map<String, dynamic> json) =>
      _$MacronutrientsFromJson(json);
}

@freezed
class Food with _$Food {
  const factory Food({
    required String id,
    required String name,
    required String quantity,
    required Macronutrients macronutrients,
  }) = _Food;

  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);
}

@freezed
class MealResponse with _$MealResponse {
  const factory MealResponse({
    required String id,
    required int type,
    required String scheduleTime,
    required List<Food> food,
  }) = _MealResponse;

  factory MealResponse.fromJson(Map<String, dynamic> json) =>
      _$MealResponseFromJson(json);
}

@freezed
class DietResponse with _$DietResponse {
  const factory DietResponse({
    @Default('Unknown ID') String id,
    @Default('Unknown Name') String name,
    @Default('Unknown Goal') String goal,
    @Default(Calories(min: 0, max: 0)) Calories calories,
    @Default(Protein(min: 0, max: 0)) Protein proteins,
    @Default(Carbohydrate(min: 0, max: 0)) Carbohydrate carbohydrates,
    @Default(Fat(min: 0, max: 0)) Fat fats,
    @Default(0) int duration,
    @Default([]) List<MealResponse> meals,
  }) = _DietResponse;

  factory DietResponse.fromJson(Map<String, dynamic> json) =>
      _$DietResponseFromJson(json);

  static List<DietResponse> fromDynamicList(List<dynamic> list) {
    return list
        .map((item) => DietResponse.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
