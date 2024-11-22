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
      required super.targetWeigth,
      required super.points});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    print('SB - points: ${json["points"].runtimeType}');
    print('SB - height: ${json["height"].runtimeType}');
    print('SB - weight: ${json["weight"].runtimeType}');
    print('SB - targetWeigth: ${json["targetWeigth"].runtimeType}');
    return UserModel(
      firstName: json["firstName"],
      lastName: json["lastName"],
      email: json["email"],
      password: json["password"] ?? '',
      height: json["height"] ?? 0.0,
      weight: json["weight"] ?? 0.0,
      gender: json["gender"] ?? '',
      dateOfBirth: json["dateOfBirth"] == null
          ? null
          : DateTime.tryParse(json["dateOfBirth"]),
      phone: json["phone"] ?? 0,
      fitnessGoal: json["fitnessGoal"] ?? '',
      targetWeigth: json["targetWeigth"] / 1.0 ?? 0.0,
      points: json["points"] ?? 0,
    );
  }

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
        points: userEntity.points,
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
        "points": points,
      };
}
