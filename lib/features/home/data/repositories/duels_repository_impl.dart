import 'package:app_gym/features/home/data/datasources/duels_datasource_remote.dart';
import 'package:app_gym/features/home/domain/entities/duels_entity.dart';
import 'package:app_gym/features/home/domain/repositories/duels_repository_interface.dart';

class DuelsRepositoryImpl implements DuelsRepositoryInterface {
  final DuelsDatasourceRemote duelsDatasourceRemote;

  DuelsRepositoryImpl({required this.duelsDatasourceRemote});
  @override
  Future<List<DuelsEntity>> getListDuelsData() async {
    return await duelsDatasourceRemote.getListDuelsRemoteData();
  }
}
