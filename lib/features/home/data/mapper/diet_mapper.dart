import 'package:app_gym/features/home/data/models/diet_model.dart' as model;
import 'package:app_gym/features/home/domain/entities/diet_entity.dart';

extension DietEntityMapper on DietEntity {
  model.DietResponse toModel() {
    return model.DietResponse(
      id: id,
      name: name,
      goal: goal,
      calories: model.Calories(min: calories.min, max: calories.max),
      proteins: model.Protein(min: proteins.min, max: proteins.max),
      carbohydrates:
          model.Carbohydrate(min: carbohydrates.min, max: carbohydrates.max),
      fats: model.Fat(min: fats.min, max: fats.max),
      duration: duration,
      meals: meals
          .map((meal) => model.MealResponse(
                id: meal.id,
                type: meal.type,
                scheduleTime: meal.scheduleTime,
                food: meal.food
                    .map((food) => model.Food(
                          id: food.id,
                          name: food.name,
                          quantity: food.quantity,
                          macronutrients: model.Macronutrients(
                            protein: food.macronutrients.protein,
                            carbohydrates: food.macronutrients.carbohydrates,
                            fat: food.macronutrients.fat,
                          ),
                        ))
                    .toList(),
              ))
          .toList(),
    );
  }
}

extension DietEntityListMapper on List<DietEntity> {
  List<model.DietResponse> toModelList() {
    return map((diet) => diet.toModel()).toList();
  }
}

extension DietResponseListMapper on List<model.DietResponse> {
  List<DietEntity> toEntityList() {
    return map((diet) => diet.toEntity()).toList();
  }
}

extension DietResponseMapper on model.DietResponse {
  DietEntity toEntity() {
    return DietEntity(
      id: id,
      name: name,
      goal: goal,
      calories: Calories(min: calories.min, max: calories.max),
      proteins: Protein(min: proteins.min, max: proteins.max),
      carbohydrates:
          Carbohydrate(min: carbohydrates.min, max: carbohydrates.max),
      fats: Fat(min: fats.min, max: fats.max),
      duration: duration,
      meals: meals
          .map((meal) => MealResponse(
                id: meal.id,
                type: meal.type,
                scheduleTime: meal.scheduleTime,
                food: meal.food
                    .map((food) => Food(
                          id: food.id,
                          name: food.name,
                          quantity: food.quantity,
                          macronutrients: Macronutrients(
                            protein: food.macronutrients.protein,
                            carbohydrates: food.macronutrients.carbohydrates,
                            fat: food.macronutrients.fat,
                          ),
                        ))
                    .toList(),
              ))
          .toList(),
    );
  }
}
