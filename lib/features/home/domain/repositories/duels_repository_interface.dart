import 'package:app_gym/features/home/domain/entities/duels_entity.dart';

abstract class DuelsRepositoryInterface {
  Future<List<DuelsEntity>> getListDuelsData();
}
