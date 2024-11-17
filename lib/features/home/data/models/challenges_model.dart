import 'package:app_gym/features/home/domain/entities/challenges_entity.dart';
import 'dart:convert';

ChallengesModel challengesFromJson(String str) =>
    ChallengesModel.fromJson(json.decode(str));

String challengesToJson(ChallengesModel data) => json.encode(data.toJson());

class ChallengesModel extends ChallengesEntity {
  ChallengesModel(
      {required super.id,
      required super.name,
      required super.description,
      required super.points,
      required super.startDate,
      required super.endDate,
      required super.type});
  factory ChallengesModel.fromJson(Map<String, dynamic> json) =>
      ChallengesModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        points: json["points"],
        startDate: json["startDate"] == null
            ? null
            : DateTime.parse(json["startDate"]),
        endDate:
            json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "points": points,
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
        "type": type,
      };
}
