import 'package:app_gym/core/bloc/result_state.dart';
import 'package:app_gym/features/home/domain/entities/diet_entity.dart';
import 'package:app_gym/features/home/domain/usecases/get_diet_list_usecase.dart';
import 'package:app_gym/features/home/presentation/bloc/diet/diet_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DietBloc extends Bloc<DietEvent, ResultState<List<DietEntity>>> {
  final GetSaveListDietsUseCase _getDietList;

  DietBloc(this._getDietList) : super(const Initial()) {
    on<DoGetDiets>(_doGetDiet);
  }

  void _doGetDiet(
      DoGetDiets event, Emitter<ResultState<List<DietEntity>>> emitter) async {
    emitter(const Loading());
    final response = await _getDietList.call();
    response.fold(
        (l) => emitter(Error(error: l)), (r) => emitter(Data(data: r)));
  }
}
