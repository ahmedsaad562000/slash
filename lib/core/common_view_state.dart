// Define base class for view state
abstract class CommonViewState<T> {
  const CommonViewState();
}

// Define loading state
class LoadingState<T> extends CommonViewState<T> {
  const LoadingState();
}

// Define success state
class SuccessState<T> extends CommonViewState<T> {
  final T data;

  const SuccessState(this.data);

  @override
  List<Object?> get props => [data];
}

// Define error state
class ErrorState<T> extends CommonViewState<T> {
  final String error;

  const ErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

// Define empty state
class EmptyState<T> extends CommonViewState<T> {
  const EmptyState();
}

class IdleState<T> extends CommonViewState<T> {
  const IdleState();
}
