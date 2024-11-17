import 'dart:convert';

import 'package:app_gym/features/home/data/models/exercise_model.dart';
import 'package:app_gym/features/home/domain/entities/rutina_entity.dart';

RutinaModel rutinaModelFromJson(String str) =>
    RutinaModel.fromJson(json.decode(str));

String rutinaModelToJson(RutinaModel data) => json.encode(data.toJson());

class RutinaModel extends RutinaEntity {
  const RutinaModel(
      {required super.id,
      required super.name,
      required super.date,
      required super.goal,
      required super.difficultyLevel,
      required super.isCompleted,
      required super.exercises});

  factory RutinaModel.fromJson(Map<String, dynamic> json) => RutinaModel(
        id: json["id"],
        name: json["name"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        goal: json["goal"],
        difficultyLevel: json["difficultyLevel"],
        isCompleted: json["isCompleted"],
        exercises: json["exercises"] == null
            ? []
            : List<ExerciseEntity>.from(
                json["exercises"]!.map((x) => ExerciseModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "date": date?.toIso8601String(),
        "goal": goal,
        "difficultyLevel": difficultyLevel,
        "isCompleted": isCompleted,
        "exercises": exercises == null
            ? []
            : List<dynamic>.from(
                exercises!.map(
                  (x) => ExerciseModel.fromEntity(x).toJson(),
                ),
              ),
      };
}
