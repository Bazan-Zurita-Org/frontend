import 'package:app_gym/features/home/domain/entities/rutina_entity.dart';

class ExerciseModel extends ExerciseEntity {
  const ExerciseModel(
      {required super.id,
      required super.name,
      required super.sets,
      required super.reps,
      required super.restTime,
      required super.equipment,
      required super.muscleGroup,
      required super.instructions});

  factory ExerciseModel.fromEntity(ExerciseEntity exerciseEntity) =>
      ExerciseModel(
        id: exerciseEntity.id,
        name: exerciseEntity.name,
        sets: exerciseEntity.sets,
        reps: exerciseEntity.reps,
        restTime: exerciseEntity.restTime,
        equipment: exerciseEntity.equipment,
        muscleGroup: exerciseEntity.muscleGroup,
        instructions: exerciseEntity.instructions,
      );

  factory ExerciseModel.fromJson(Map<String, dynamic> json) => ExerciseModel(
        id: json["id"],
        name: json["name"],
        sets: json["sets"],
        reps: json["reps"],
        restTime: json["restTime"],
        equipment: json["equipment"],
        muscleGroup: json["muscleGroup"],
        instructions: json["instructions"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sets": sets,
        "reps": reps,
        "restTime": restTime,
        "equipment": equipment,
        "muscleGroup": muscleGroup,
        "instructions": instructions,
      };
}
