import 'dart:convert';

import 'package:equatable/equatable.dart';

class RutinaEntity extends Equatable {
  final String? id;
  final String? name;
  final DateTime? date;
  final String? goal;
  final int? difficultyLevel;
  final bool? isCompleted;
  final List<ExerciseEntity>? exercises;

  const RutinaEntity({
    required this.id,
    required this.name,
    required this.date,
    required this.goal,
    required this.difficultyLevel,
    required this.isCompleted,
    required this.exercises,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        date,
        goal,
        difficultyLevel,
        isCompleted,
        exercises,
      ];
}

class ExerciseEntity extends Equatable {
  final String? id;
  final String? name;
  final int? sets;
  final int? reps;
  final String? restTime;
  final String? equipment;
  final String? muscleGroup;
  final String? instructions;

  const ExerciseEntity({
    required this.id,
    required this.name,
    required this.sets,
    required this.reps,
    required this.restTime,
    required this.equipment,
    required this.muscleGroup,
    required this.instructions,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        sets,
        reps,
        restTime,
        equipment,
        muscleGroup,
        instructions,
      ];
}
