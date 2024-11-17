import 'package:app_gym/features/home/data/datasources/rutine_datasource_remote.dart';
import 'package:app_gym/features/home/domain/entities/rutina_entity.dart';
import 'package:app_gym/features/home/domain/repositories/rutine_repository_interface.dart';

class RutineRepositoryImpl implements RutineRepositoryInterface {
  final RutineDatasourceRemote rutineDatasourceRemote;

  RutineRepositoryImpl({required this.rutineDatasourceRemote});
  @override
  Future<RutinaEntity> deleteSingleRutineData() {
    // TODO: implement deleteSingleRutineData
    throw UnimplementedError();
  }

  @override
  Future<List<RutinaEntity>> getListRutineData() async {
    return await rutineDatasourceRemote.getListRutineDataRemote();
  }

  @override
  Future<RutinaEntity> getSingleRutineData() {
    // TODO: implement getSingleRutineData
    throw UnimplementedError();
  }

  @override
  Future<RutinaEntity> saveSingleRutineData() {
    // TODO: implement saveSingleRutineData
    throw UnimplementedError();
  }

  @override
  Future<RutinaEntity> updateSingleRutineData() {
    // TODO: implement updateSingleRutineData
    throw UnimplementedError();
  }
}
