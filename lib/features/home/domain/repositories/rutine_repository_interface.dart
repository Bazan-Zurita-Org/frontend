import 'package:app_gym/features/home/domain/entities/rutina_entity.dart';

abstract class RutineRepositoryInterface {
  Future<List<RutinaEntity>> getListRutineData();
  Future<RutinaEntity> getSingleRutineData();
  Future<RutinaEntity> saveSingleRutineData();
  Future<RutinaEntity> updateSingleRutineData();
  Future<RutinaEntity> deleteSingleRutineData();
}
