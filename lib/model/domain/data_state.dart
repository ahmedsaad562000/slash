abstract class DataState<T> {
  final bool loading;
  final T? data;

  const DataState(this.loading, this.data);

  factory DataState.idle() => Idle<T>();

  factory DataState.error(Exception throwable) => Error<T>(throwable);

  factory DataState.success(T data) => Success<T>(data);

  factory DataState.empty() => Empty<T>();
}

class Idle<T> extends DataState<T> {
  Idle() : super(false, null);
}

class Error<T> extends DataState<T> {
  final Exception throwable;

  Error(this.throwable) : super(false, null);
}

class Success<T> extends DataState<T> {
  Success(T data) : super(false, data);
}

class Empty<T> extends DataState<T> {
  Empty() : super(false, null);
}
