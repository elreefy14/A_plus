import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../network_exceptions.dart';
part 'auth_state.freezed.dart';

@freezed
class AuthState<T> with _$AuthState<T> {
  const factory AuthState.idle() = Idle<T>;
  const factory AuthState.loading() = Loading<T>;
  const factory AuthState.success() = Success<T>;
  const factory AuthState.error(NetworkExceptions networkExceptions) =
  Error<T>;
}
