import './login_api.dart';

class LoginRepository {
  LoginRepository({required LoginAPI homeNetworkService})
      : _homeNetworkService = homeNetworkService;

  var _totalData = 0;
  final LoginAPI _homeNetworkService;

  int get totalData => _totalData;

  Future verifyOTP({required String mobile, required String otp}) async {
    final result =
        await _homeNetworkService.verifyOTP(mobile: mobile, otp: otp);
    result.when(success: (payload) {
      //Do anything with response
      print(payload);
    }, error: (message) {
      //Do anything with error
      print(message);
    });
  }

  Future getExamplecall() async {
    final result = await _homeNetworkService.loginAPICall();
    print(result);
    result.when(
      success: (payload) {
        _totalData = payload.length;
      },
      error: (message) {},
    );
  }
}
