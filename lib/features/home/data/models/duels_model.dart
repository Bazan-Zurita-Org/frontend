import 'dart:convert';

import 'package:app_gym/features/home/domain/entities/duels_entity.dart';

DuelsModel duelsModelFromJson(String str) =>
    DuelsModel.fromJson(json.decode(str));

String duelsModelToJson(DuelsModel data) => json.encode(data.toJson());

class DuelsModel extends DuelsEntity {
  const DuelsModel(
      {required super.duelId,
      required super.challengerName,
      required super.challengeText,
      required super.startDate,
      required super.endDate});
      
  factory DuelsModel.fromJson(Map<String, dynamic> json) => DuelsModel(
        duelId: json["duelId"],
        challengerName: json["challengerName"],
        challengeText: json["challengeText"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
      );

  Map<String, dynamic> toJson() => {
        "duelId": duelId,
        "challengerName": challengerName,
        "challengeText": challengeText,
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
      };
}
