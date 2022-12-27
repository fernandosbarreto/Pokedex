abstract class GenericState {}

class GenericStateData implements GenericState {
  final dynamic data;

  GenericStateData(this.data);
}

class GenericStateLoading implements GenericState {}

class GenericStateError implements GenericState {
  final String message;
  final StackTrace stackTrace;

  GenericStateError(this.message, this.stackTrace);
}
