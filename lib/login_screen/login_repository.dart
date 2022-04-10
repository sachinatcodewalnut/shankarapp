import './login_api.dart';

class LoginRepository {
  LoginRepository({required LoginAPI homeNetworkService})
      : _homeNetworkService = homeNetworkService;

  var _totalData = 0;
  final LoginAPI _homeNetworkService;

  int get totalData => _totalData;

  Future emailLogin({required String email, required String password}) async {
    final result =
        await _homeNetworkService.emailLogin(email: email, password: password);
    result.when(success: (payload) {
      //Do anything with response
    }, error: (message) {
      //Do anything with error
    });
  }

  Future getExamplecall() async {
    final result = await _homeNetworkService.loginAPICall();
    result.when(
      success: (payload) {
        _totalData = payload.length;
      },
      error: (message) {},
    );
  }
}
