import 'package:app_gym/core/api/api_client_repository.dart';
import 'package:app_gym/core/helper/app_constants.dart';
import 'package:app_gym/features/home/data/models/ranking_model.dart';
import 'package:app_gym/features/home/domain/entities/rankings_entity.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RankingDatasourceRemote {
  Future<List<RanKingEntity>> getListRankingDataRemote();
}

class RankingDatasourceRemoteImpl implements RankingDatasourceRemote {
  final ApiClientRepository apiClientRepository;
  final SharedPreferences sharedPreferences;

  RankingDatasourceRemoteImpl(
      {required this.apiClientRepository, required this.sharedPreferences});

  @override
  Future<List<RanKingEntity>> getListRankingDataRemote() async {
    try {
      final data = await apiClientRepository.getData(AppConstants.rankings);
      debugPrint("la data es $data");
      debugPrint("Los datos del ranking son $data");
      if (data.statusCode == 200) {
        final result = (data.data as List<dynamic>)
            .map((value) => RanKingModel.fromJson(value))
            .toList();
        return result;
      }
      return [];
    } catch (e) {
      debugPrint("el error de los ranking es $e");
      return [];
    }
  }
}
