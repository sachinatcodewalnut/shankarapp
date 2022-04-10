class ErrorResponse {
  ErrorResponse({this.errorCode, required this.message});
  final String? errorCode;
  final String message;

  ErrorResponse.fromJson(Map<String, dynamic> json)
      : errorCode = json['error_code'] as String?,
        message = json['message'] as String;

}
