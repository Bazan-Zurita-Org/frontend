import 'package:app_gym/core/api/api_client_repository.dart';
import 'package:app_gym/core/helper/app_constants.dart';
import 'package:app_gym/features/home/data/mapper/diet_mapper.dart';
import 'package:app_gym/features/home/data/models/diet_model.dart';
import 'package:app_gym/features/home/domain/entities/diet_entity.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class DietDatasourceRemote {
  Future<List<DietEntity>> getListDietRemoteData();
}

class DietDatasourceRemoteImpl implements DietDatasourceRemote {
  final ApiClientRepository apiClientRepository;
  final SharedPreferences sharedPreferences;

  DietDatasourceRemoteImpl(
      {required this.apiClientRepository, required this.sharedPreferences});
  @override
  Future<List<DietEntity>> getListDietRemoteData() async {
    try {
      final id = sharedPreferences.getString(AppConstants.id);
      final data =
          await apiClientRepository.getData(AppConstants.dietForId(id!));
      if (data.statusCode == 200) {
        final result = DietResponse.fromDynamicList(
            data.data["nutrionalPlan"] as List<dynamic>);
        return result.toEntityList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
