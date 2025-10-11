import 'package:architecture_pattern/core/errors/failures.dart';

class Result<T> {
  final T? data;
  final Failure? failure;
  bool get isSuccess => data != null;

  Result._(this.data, this.failure);
  Result.success(T data) : this._(data, null);
  Result.failure(Failure failure) : this._(null, failure);
}