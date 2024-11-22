import 'package:app_gym/features/home/domain/entities/diet_entity.dart';

abstract class DietRepositoryInterface {
  Future<List<DietEntity>> getDietList();
}
