// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CaloriesImpl _$$CaloriesImplFromJson(Map<String, dynamic> json) =>
    _$CaloriesImpl(
      min: (json['min'] as num?)?.toInt() ?? 0,
      max: (json['max'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$CaloriesImplToJson(_$CaloriesImpl instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
    };

_$ProteinImpl _$$ProteinImplFromJson(Map<String, dynamic> json) =>
    _$ProteinImpl(
      min: (json['min'] as num?)?.toInt() ?? 0,
      max: (json['max'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ProteinImplToJson(_$ProteinImpl instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
    };

_$CarbohydrateImpl _$$CarbohydrateImplFromJson(Map<String, dynamic> json) =>
    _$CarbohydrateImpl(
      min: (json['min'] as num?)?.toInt() ?? 0,
      max: (json['max'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$CarbohydrateImplToJson(_$CarbohydrateImpl instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
    };

_$FatImpl _$$FatImplFromJson(Map<String, dynamic> json) => _$FatImpl(
      min: (json['min'] as num?)?.toInt() ?? 0,
      max: (json['max'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$FatImplToJson(_$FatImpl instance) => <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
    };

_$MacronutrientsImpl _$$MacronutrientsImplFromJson(Map<String, dynamic> json) =>
    _$MacronutrientsImpl(
      protein: (json['protein'] as num?)?.toInt() ?? 0,
      carbohydrates: (json['carbohydrates'] as num?)?.toInt() ?? 0,
      fat: (json['fat'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$MacronutrientsImplToJson(
        _$MacronutrientsImpl instance) =>
    <String, dynamic>{
      'protein': instance.protein,
      'carbohydrates': instance.carbohydrates,
      'fat': instance.fat,
    };

_$FoodImpl _$$FoodImplFromJson(Map<String, dynamic> json) => _$FoodImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      quantity: json['quantity'] as String,
      macronutrients: Macronutrients.fromJson(
          json['macronutrients'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FoodImplToJson(_$FoodImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'quantity': instance.quantity,
      'macronutrients': instance.macronutrients,
    };

_$MealResponseImpl _$$MealResponseImplFromJson(Map<String, dynamic> json) =>
    _$MealResponseImpl(
      id: json['id'] as String,
      type: (json['type'] as num).toInt(),
      scheduleTime: json['scheduleTime'] as String,
      food: (json['food'] as List<dynamic>)
          .map((e) => Food.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MealResponseImplToJson(_$MealResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'scheduleTime': instance.scheduleTime,
      'food': instance.food,
    };

_$DietResponseImpl _$$DietResponseImplFromJson(Map<String, dynamic> json) =>
    _$DietResponseImpl(
      id: json['id'] as String? ?? 'Unknown ID',
      name: json['name'] as String? ?? 'Unknown Name',
      goal: json['goal'] as String? ?? 'Unknown Goal',
      calories: json['calories'] == null
          ? const Calories(min: 0, max: 0)
          : Calories.fromJson(json['calories'] as Map<String, dynamic>),
      proteins: json['proteins'] == null
          ? const Protein(min: 0, max: 0)
          : Protein.fromJson(json['proteins'] as Map<String, dynamic>),
      carbohydrates: json['carbohydrates'] == null
          ? const Carbohydrate(min: 0, max: 0)
          : Carbohydrate.fromJson(
              json['carbohydrates'] as Map<String, dynamic>),
      fats: json['fats'] == null
          ? const Fat(min: 0, max: 0)
          : Fat.fromJson(json['fats'] as Map<String, dynamic>),
      duration: (json['duration'] as num?)?.toInt() ?? 0,
      meals: (json['meals'] as List<dynamic>?)
              ?.map((e) => MealResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$DietResponseImplToJson(_$DietResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'goal': instance.goal,
      'calories': instance.calories,
      'proteins': instance.proteins,
      'carbohydrates': instance.carbohydrates,
      'fats': instance.fats,
      'duration': instance.duration,
      'meals': instance.meals,
    };
