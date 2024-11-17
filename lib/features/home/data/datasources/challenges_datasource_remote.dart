import 'package:app_gym/core/api/api_client_repository.dart';
import 'package:app_gym/core/helper/app_constants.dart';
import 'package:app_gym/features/home/data/models/challenges_model.dart';
import 'package:app_gym/features/home/domain/entities/challenges_entity.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ChallengesDatasourceRemote {
  Future<List<ChallengesEntity>> getListChallengesRemoteData();
  Future<String?> assigChallengByType(
      {required String type,
      required (String traineeld, String challengeId)? body,
      required Map<String, dynamic>? groud});
}

class ChallengesDatasourceRemoteImpl implements ChallengesDatasourceRemote {
  final ApiClientRepository apiClientRepository;
  final SharedPreferences sharedPreferences;

  ChallengesDatasourceRemoteImpl(
      {required this.apiClientRepository, required this.sharedPreferences});
  @override
  Future<List<ChallengesEntity>> getListChallengesRemoteData() async {
    try {
      final id = sharedPreferences.getString(AppConstants.id);
      final data = await apiClientRepository
          .getData(AppConstants.challengesforUser(id!));
      debugPrint("los datos del challenges son $data");
      if (data.statusCode == 200) {
        final result = (data.data["challenges"] as List<dynamic>)
            .map((value) => ChallengesModel.fromJson(value))
            .toList();
        return result;
      }
      return [];
    } catch (e) {
      debugPrint("el error en la lista challenges es $e");
      return [];
    }
  }

  @override
  Future<String?> assigChallengByType(
      {required String type,
      required (String traineeld, String challengeId)? body,
      required Map<String, dynamic>? groud}) async {
    try {
      if (type == "1") {
        final data = await apiClientRepository.postData(
          AppConstants.assignChallengeToUse,
          {"traineeId": body!.$1, "challengeId": body.$2},
        );
        if (data.data != null) {
          return data.data.toString();
        }
        return null;
      } else {
        final data = await apiClientRepository.postData(
            AppConstants.assignDuelsToUser, groud);
        if (data.data != null) {
          return data.data.toString();
        }
        return null;
      }
    } catch (e) {
      debugPrint("El error al asignar es $e");
      return null;
    }
  }
}
