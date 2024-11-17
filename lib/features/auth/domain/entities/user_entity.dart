import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final int? height;
  final int? weight;
  final String? gender;
  final DateTime? dateOfBirth;
  final String? phone;
  final String? fitnessGoal;
  final int? targetWeigth;

  const UserEntity(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.height,
      required this.weight,
      required this.gender,
      required this.dateOfBirth,
      required this.phone,
      required this.fitnessGoal,
      required this.targetWeigth});
  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        height,
        weight,
        gender,
        dateOfBirth,
        phone,
        fitnessGoal,
        targetWeigth
      ];
}
