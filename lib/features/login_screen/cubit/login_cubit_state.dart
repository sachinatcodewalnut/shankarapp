import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shankra/features/login_screen/login_modal.dart';

// part of 'login_cubit.dart';
@freezed
class LoginState with _$LoginState {
  // @With<PrintLoadingState>()
  const factory LoginState.loading() = _Loading;
  // @With<PrintLoadedState>()
  const factory LoginState.loaded({
    required List<UserLoginModal> userTrips,
  }) = _Loaded;
}
