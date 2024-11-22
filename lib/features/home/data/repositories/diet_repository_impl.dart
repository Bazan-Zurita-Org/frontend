import 'package:app_gym/features/home/data/datasources/diet_remote_datasource.dart';
import 'package:app_gym/features/home/domain/entities/diet_entity.dart';
import 'package:app_gym/features/home/domain/repositories/diet_repository_interface.dart';

class DietRepositoryImpl implements DietRepositoryInterface {
  final DietDatasourceRemote dietDatasourceRemote;

  DietRepositoryImpl({required this.dietDatasourceRemote});
  @override
  Future<List<DietEntity>> getDietList() async {
    return await dietDatasourceRemote.getListDietRemoteData();
  }
}
