import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../login_repository.dart';
import '../login_api.dart';
import '../login_modal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_cubit_state.dart';
part 'login_cubit.freezed.dart';

class UsertripsCubit extends Cubit<LoginState> {
  final Logger _logger = Modular.get<Logger>();

  UsertripsCubit() : super(const LoginState.loading());

  final loginRepo =
      LoginRepository(homeNetworkService: Modular.get<UserLoginModal>());

  void getUserTrips(mobile, otp) async {
    await loginRepo.verifyOTP(mobile: mobile, otp: otp);
    emit(LoginState.loaded(userLogin: loginRepo.verifyOTP));
  }

  @override
  void onChange(Change<LoginState> change) {
    super.onChange(change);
    final current = change.currentState.map(
      loading: (_) => "Loading",
      loaded: (_) => "Loaded",
    );
    final next = change.nextState.map(
      loading: (_) => "Loading",
      loaded: (_) => "Loaded",
    );
    _logger.i("Change { currentState: $current, nextState: $next }");
  }
}
