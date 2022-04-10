import 'dart:io';

import './error_response_code.dart';
import 'package:dio/dio.dart';

typedef Decoder<R> = R Function(Map<String, dynamic> data);
typedef Decoder2<R> = R Function(dynamic data);
typedef OnSuccess<R, T> = R Function(T response);
typedef OnError<R> = R Function(ErrorResponse? response);

abstract class NetworkService {
  final Dio dio;
  NetworkService({required this.dio});
  // //overlaysController //overlaysController = g.Get.find();
  Future<Result> post<Result, Resp>(
    String endpoint, {
    bool isFormData = false,
    required Map<String, dynamic> body,
    required Decoder<Resp> decoder,
    required OnSuccess<Result, Resp> onSuccess,
    required OnError<Result> onError,
  }) async {
    try {
      // //overlaysController.loading.value = true;
      final requestData = isFormData ? FormData.fromMap(body) : body;
      final response =
          await dio.post(dio.options.baseUrl + endpoint, data: requestData);
      final decodedResponse = decoder(response.data as Map<String, dynamic>);
      return onSuccess(decodedResponse);
    } on DioError catch (error) {
      return _handleError(
        error,
        onError: onError,
      );
    } catch (error) {
      //error.printError();
      return onError(ErrorResponse(message: "Internal Error"));
    } finally {
      // //overlaysController.loading.value = false;
    }
  }

  Future<Result> postDynamic<Result, Resp>(
    String endpoint, {
    required List<dynamic> body,
    required Decoder2<Resp> decoder,
    required OnSuccess<Result, Resp> onSuccess,
    required OnError<Result> onError,
  }) async {
    try {
      //overlaysController.loading.value = true;
      final requestData = body;
      final response =
          await dio.post(dio.options.baseUrl + endpoint, data: requestData);
      final decodedResponse = decoder(response.data);
      return onSuccess(decodedResponse);
    } on DioError catch (error) {
      return _handleError(
        error,
        onError: onError,
      );
    } catch (error) {
      //error.printError();
      return onError(ErrorResponse(message: "Internal Error"));
    } finally {
      //overlaysController.loading.value = false;
    }
  }

  Future<Result> getMap<Result, Resp>(
    String endpoint, {
    required Decoder<Resp> decoder,
    required OnSuccess<Result, Resp> onSuccess,
    required OnError<Result> onError,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      //overlaysController.loading.value = true;
      final response =
          await dio.get(endpoint, queryParameters: queryParameters);
      final decodedResponse = decoder(response.data as Map<String, dynamic>);
      return onSuccess(decodedResponse);
    } on DioError catch (error) {
      return _handleError(
        error,
        onError: onError,
      );
    } finally {
      //overlaysController.loading.value = false;
    }
  }

  Future<Result> get<Result, Resp>(
    String endpoint, {
    required Decoder2<Resp> decoder,
    required OnSuccess<Result, Resp> onSuccess,
    required OnError<Result> onError,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      //overlaysController.loading.value = true;
      print(endpoint);
      final response =
          await dio.get(endpoint, queryParameters: queryParameters);
      print(response);
      final decodedResponse = decoder(response.data);
      return onSuccess(decodedResponse);
    } on DioError catch (error) {
      print(error);
      return _handleError(
        error,
        onError: onError,
      );
    } catch (error) {
      print(error);
      // //error.printError();
      return onError(
        ErrorResponse(
          errorCode: '',
          message: "Internal Error",
        ),
      );
    } finally {
      //overlaysController.loading.value = false;
    }
  }

  Future<Result> patch<Result, Resp>(
    String endpoint, {
    required Map<String, dynamic> body,
    required Decoder<Resp> decoder,
    required OnSuccess<Result, Resp> onSuccess,
    required OnError<Result> onError,
  }) async {
    try {
      //overlaysController.loading.value = true;
      final response = await dio.patch(endpoint, data: body);
      final decodedResponse = decoder(response.data as Map<String, dynamic>);
      return onSuccess(decodedResponse);
    } on DioError catch (error) {
      return _handleError(
        error,
        onError: onError,
      );
    } finally {
      //overlaysController.loading.value = false;
    }
  }

  Future<Result> patchDynamic<Result, Resp>(
    String endpoint, {
    required Map<String, dynamic> body,
    required Decoder2<Resp> decoder,
    required OnSuccess<Result, Resp> onSuccess,
    required OnError<Result> onError,
  }) async {
    try {
      //overlaysController.loading.value = true;
      final response = await dio.patch(endpoint, data: body);
      final decodedResponse = decoder(response.data);
      return onSuccess(decodedResponse);
    } on DioError catch (error) {
      return _handleError(
        error,
        onError: onError,
      );
    } finally {
      //overlaysController.loading.value = false;
    }
  }

  Future<Result> put<Result, Resp>(
    String endpoint, {
    required Map<String, dynamic> body,
    required Decoder<Resp> decoder,
    required OnSuccess<Result, Resp> onSuccess,
    required OnError<Result> onError,
  }) async {
    try {
      //overlaysController.loading.value = true;
      final response = await dio.put(endpoint, data: body);
      final decodedResponse = decoder(response.data as Map<String, dynamic>);
      return onSuccess(decodedResponse);
    } on DioError catch (error) {
      return _handleError(
        error,
        onError: onError,
      );
    } finally {
      //overlaysController.loading.value = false;
    }
  }

  Future<Result> delete<Result, Resp>(
    String endpoint, {
    Map<String, dynamic>? body,
    required Decoder<Resp> decoder,
    required OnSuccess<Result, Resp> onSuccess,
    required OnError<Result> onError,
  }) async {
    try {
      //overlaysController.loading.value = true;
      final response = await dio.delete(endpoint, data: body);
      final decodedResponse = decoder(response.data as Map<String, dynamic>);
      return onSuccess(decodedResponse);
    } on DioError catch (error) {
      return _handleError(
        error,
        onError: onError,
      );
    } finally {
      //overlaysController.loading.value = false;
    }
  }

  Future<Result> uploadFile<Result, Resp>(
    String endpoint, {
    required File file,
    required Decoder<Resp> decoder,
    required OnSuccess<Result, Resp> onSuccess,
    required OnError<Result> onError,
  }) async {
    try {
      //overlaysController.loading.value = true;
      final fileName = file.path.split('/').last;
      final requestData = FormData.fromMap({
        'file': await MultipartFile.fromFile(file.path, filename: fileName),
      });
      final response =
          await dio.post(dio.options.baseUrl + endpoint, data: requestData);
      final decodedResponse = decoder(response.data as Map<String, dynamic>);
      return onSuccess(decodedResponse);
    } on DioError catch (error) {
      return _handleError(
        error,
        onError: onError,
      );
    } catch (error) {
      //error.printError();
      return onError(ErrorResponse(message: "Internal Error"));
    } finally {
      //overlaysController.loading.value = false;
    }
  }

  Result _handleError<Result>(
    DioError error, {
    required OnError<Result> onError,
  }) {
    if (error.error is SocketException) {
      return onError(ErrorResponse(message: "Internet Connection Error"));
    }
    if (error.type == DioErrorType.connectTimeout) {
      return onError(ErrorResponse(message: "Internet Connection Error"));
    }
    if (error.response == null) {
      return onError(null);
    }
    if (error.response!.data is String) {
      final errorResponse =
          ErrorResponse(message: error.response!.data as String);
      return onError(errorResponse);
    }
    final errorResponse =
        ErrorResponse.fromJson(error.response!.data as Map<String, dynamic>);
    return onError(errorResponse);
  }
}
