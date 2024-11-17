import 'package:app_gym/core/api/api_client_repository.dart';
import 'package:app_gym/core/helper/app_constants.dart';
import 'package:app_gym/features/home/data/models/rutina_model.dart';
import 'package:app_gym/features/home/domain/entities/rutina_entity.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RutineDatasourceRemote {
  Future<List<RutinaEntity>> getListRutineDataRemote();
}

class RutineDatasourceRemoteImpl implements RutineDatasourceRemote {
  final ApiClientRepository apiClientRepository;
  final SharedPreferences sharedPreferences;
  RutineDatasourceRemoteImpl(
      {required this.apiClientRepository, required this.sharedPreferences});
  @override
  Future<List<RutinaEntity>> getListRutineDataRemote() async {
    try {
      final id = sharedPreferences.getString(AppConstants.id);
      final data = await apiClientRepository.getData(
        AppConstants.routineforUse(id!),
      );
      debugPrint("el resultado es $data");
      if (data.statusCode == 200) {
        final result = (data.data["routine"] as List<dynamic>)
            .map((value) => RutinaModel.fromJson(value))
            .toList();

        return result;
      }
      return [];
    } catch (e) {
      debugPrint("el error es $e");
      return [];
    }
  }
}
