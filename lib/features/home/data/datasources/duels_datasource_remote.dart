import 'package:app_gym/core/api/api_client_repository.dart';
import 'package:app_gym/core/helper/app_constants.dart';
import 'package:app_gym/features/home/data/models/duels_model.dart';
import 'package:app_gym/features/home/domain/entities/duels_entity.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class DuelsDatasourceRemote {
  Future<List<DuelsEntity>> getListDuelsRemoteData();
}

class DuelsDatasourceRemoteImpl implements DuelsDatasourceRemote {
  final ApiClientRepository apiClientRepository;
  final SharedPreferences sharedPreferences;

  DuelsDatasourceRemoteImpl(
      {required this.apiClientRepository, required this.sharedPreferences});
  @override
  Future<List<DuelsEntity>> getListDuelsRemoteData() async {
    try {
      final id = sharedPreferences.getString(AppConstants.id);
      final data = await apiClientRepository.getData(
        AppConstants.getDuelsPropuest(id!),
      );
      if (data.statusCode == 200) {
        debugPrint("la lista de duels es ${data.data}");
        return (data.data as List<dynamic>)
            .map((value) => DuelsModel.fromJson(value))
            .toList();
      }
      return [];
    } catch (e) {
      debugPrint("El error es $e");
      return [];
    }
  }
}
