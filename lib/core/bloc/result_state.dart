import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_state.freezed.dart';

@freezed
class ResultState<T> with _$ResultState<T> {
  const factory ResultState.initial() = Initial<T>;

  const factory ResultState.loading() = Loading<T>;

  const factory ResultState.loadingWithMessage({required String? message}) =
      LoadingWithMessage<T>;

  const factory ResultState.data({required T data}) = Data<T>;

  const factory ResultState.error({required String error}) = Error<T>;
}
