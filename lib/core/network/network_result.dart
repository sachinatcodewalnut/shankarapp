import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_result.freezed.dart';

@freezed
class NetworkResult<T> with _$NetworkResult<T> {
  const factory NetworkResult.success([T? payload]) = Success;
  const factory NetworkResult.error([String? message]) = Error;
}
