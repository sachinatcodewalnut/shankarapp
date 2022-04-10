import 'login_modal.dart';
import '../core/network/network_result.dart';
import '../core/network//network_service.dart';
import 'package:dio/src/dio.dart';
import 'package:flutter/foundation.dart';

class LoginAPI extends NetworkService {
  static const String postsEndpoint = '/posts';
  static const String emailLoginEndpoint = '/api/app_login';

  LoginAPI({required Dio dio}) : super(dio: dio);

  Future<NetworkResult> loginAPICall() async {
    return get<NetworkResult, UserLoginModal>(
      postsEndpoint,
      decoder: (data) {
        if (kDebugMode) {
          print("Example Data $data");
        }
        UserLoginModal u = UserLoginModal.fromJson(data);
        return u;
      },
      onSuccess: _onSuccessExample,
      onError: (response) => NetworkResult.error(response?.message),
    );
  }

  NetworkResult _onSuccessExample(UserLoginModal response) {
    return NetworkResult.success(response);
  }

  Future<NetworkResult> emailLogin(
      {required String email, required String password}) async {
    return post<NetworkResult, dynamic>(
      emailLoginEndpoint,
      body: {'email': email, 'password': password},
      decoder: (data) => data,
      onSuccess: _onSuccessLogin,
      onError: (response) => NetworkResult.error(response?.message),
    );
  }

  NetworkResult _onSuccessLogin(dynamic response) {
    return const NetworkResult.success();
  }
}
