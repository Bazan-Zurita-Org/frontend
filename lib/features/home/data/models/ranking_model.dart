import 'package:app_gym/features/home/domain/entities/rankings_entity.dart';
import 'dart:convert';

RanKingModel ranKingFromJson(String str) =>
    RanKingModel.fromJson(json.decode(str));

String ranKingToJson(RanKingModel data) => json.encode(data.toJson());

class RanKingModel extends RanKingEntity {
  RanKingModel(
      {required super.id,
      required super.firstName,
      required super.lastName,
      required super.points});
  factory RanKingModel.fromJson(Map<String, dynamic> json) => RanKingModel(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        points: json["points"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "points": points,
      };
}
