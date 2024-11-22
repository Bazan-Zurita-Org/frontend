class DietEntity {
  final String id;
  final String name;
  final String goal;
  final Calories calories;
  final Protein proteins;
  final Carbohydrate carbohydrates;
  final Fat fats;
  final int duration;
  final List<MealResponse> meals;

  DietEntity({
    required this.id,
    required this.name,
    required this.goal,
    required this.calories,
    required this.proteins,
    required this.carbohydrates,
    required this.fats,
    required this.duration,
    required this.meals,
  });
}

class Calories {
  final int min;
  final int max;

  Calories({required this.min, required this.max});
}

class Protein {
  final int min;
  final int max;

  Protein({required this.min, required this.max});
}

class Carbohydrate {
  final int min;
  final int max;

  Carbohydrate({required this.min, required this.max});
}

class Fat {
  final int min;
  final int max;

  Fat({required this.min, required this.max});
}

class Macronutrients {
  final int protein;
  final int carbohydrates;
  final int fat;

  Macronutrients({
    required this.protein,
    required this.carbohydrates,
    required this.fat,
  });
}

class Food {
  final String id;
  final String name;
  final String quantity;
  final Macronutrients macronutrients;

  Food({
    required this.id,
    required this.name,
    required this.quantity,
    required this.macronutrients,
  });
}

class MealResponse {
  final String id;
  final int type;
  final String scheduleTime;
  final List<Food> food;

  MealResponse({
    required this.id,
    required this.type,
    required this.scheduleTime,
    required this.food,
  });
}
