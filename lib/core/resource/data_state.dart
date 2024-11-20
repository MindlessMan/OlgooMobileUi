abstract class DataState<T> {
  final T? data;
  final String? error;
  const DataState({this.data, this.error});
}

class SuccessData<T> extends DataState<T> {
  const SuccessData(T? data) : super(data: data, error: null);
}

class FailedData<T> extends DataState<T> {
  const FailedData(String error) : super(data: null, error: error);
}
