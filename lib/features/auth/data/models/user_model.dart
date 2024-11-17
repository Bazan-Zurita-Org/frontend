import 'dart:convert';

import 'package:app_gym/features/auth/domain/entities/user_entity.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends UserEntity {
  const UserModel(
      {required super.firstName,
      required super.lastName,
      required super.email,
      required super.password,
      required super.height,
      required super.weight,
      required super.gender,
      required super.dateOfBirth,
      required super.phone,
      required super.fitnessGoal,
      required super.targetWeigth});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        password: json["password"],
        height: json["height"],
        weight: json["weight"],
        gender: json["gender"],
        dateOfBirth: json["dateOfBirth"] == null
            ? null
            : DateTime.parse(json["dateOfBirth"]),
        phone: json["phone"],
        fitnessGoal: json["fitnessGoal"],
        targetWeigth: json["targetWeigth"],
      );
  factory UserModel.fromEntity(UserEntity userEntity) => UserModel(
        firstName: userEntity.firstName,
        lastName: userEntity.lastName,
        email: userEntity.email,
        password: userEntity.password,
        height: userEntity.height,
        weight: userEntity.weight,
        gender: userEntity.gender,
        dateOfBirth: userEntity.dateOfBirth,
        phone: userEntity.phone,
        fitnessGoal: userEntity.fitnessGoal,
        targetWeigth: userEntity.targetWeigth,
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "height": height,
        "weight": weight,
        "gender": gender,
        "dateOfBirth":
            "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "phone": phone,
        "fitnessGoal": fitnessGoal,
        "targetWeigth": targetWeigth,
      };
}
