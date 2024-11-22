abstract class UseCase<T, P> {
  Future<T> call(P? params) {
    if (params == null || params is NoParams) {
      return _execute();
    } else {
      return _execute(params: params);
    }
  }

  Future<T> _execute({P params});
}

class NoParams {
  const NoParams();
}
