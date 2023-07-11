import 'package:dio/dio.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_getx_template/core/core/constant/app_constant.dart';
import 'package:flutter_getx_template/core/core/utils/custom_exception.dart';
import 'package:flutter_getx_template/core/core/utils/logger.dart';
import 'package:flutter_getx_template/data/storage.dart';
import 'package:get/get.dart' hide Response;

class NetworkCore {
  static final noNeedToken = ['/login'];

  static bool isNeedToken(String route) => !noNeedToken.contains(route);

  final _dio = Dio();
  final storage = StorageCore();

  BaseOptions reqResBaseUrl() {
    _dio.interceptors.clear();
    // _dio.httpClientAdapter.onHttpClientCreate =

    _dio.interceptors.add(
      InterceptorsWrapper(onRequest: (options, handler) {
        Fimber.i('Option path ${options.path}');
        /// TODO - Setup to intercepting expired token
        // if (isNeedToken(options.path)) {
        //   // final token = storage.read(ProfileStorage.TOKEN);
        //   if (options.baseUrl == AppConstant.BASE_URL) {
        //     final token = storage.getAccessToken();
        //     options.headers = {
        //       ...options.headers,
        //       'Authorization': 'Bearer $token'
        //     };
        //   }
        // }
        Logger.logRequest(options);
        return handler.next(options);
      }, onResponse: (response, handler) async {
        Logger.logResponse(response);
        return handler.next(response);
      }, onError: (dioError, handler) async {
        /// TODO - Setup to intercepting expired token
        // final statusCode = dioError.response?.statusCode;
        // if (statusCode != null) {
        //   if (statusCode == 302) {
        //     await storage.deleteAuthResponse();
        //     Get.offNamed(LoginScreen.routeName);
        //   }
        // }
        Logger.logError(dioError);
        return handler.next(dioError);
      }),
    );
    return BaseOptions(
        // baseUrl: "https://smart.bandungbaratkab.go.id/api",
        baseUrl: AppConstant.BASE_URL,
        connectTimeout: const Duration(minutes: 1),
        receiveTimeout: const Duration(minutes: 1),
        contentType: "application/json");
  }

  Future<Response?> get(String url,
      {Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters,
      int cacheDays = 7,
      required BaseOptions options,
      bool forceRefresh = true}) async {
    _dio.options = options.copyWith(contentType: "application/json");
    Response? response;
    try {
      response = await _dio.get(url,
          options: Options(headers: headers), queryParameters: queryParameters);
    } on DioException catch (e) {
      EasyLoading.dismiss();
      _onErrorResponse(e);
    }
    return response;
  }

  Future<Response?> post(String url,
      {Map<String, dynamic>? headers,
      Function(int, int)? onSendProgress,
      body,
      int cacheDays = 7,
      required BaseOptions options,
      bool forceRefresh = true,
      ResponseType? responseType}) async {
    _dio.options = options.copyWith(
      contentType: "application/json",
    );
    Response? response;
    try {
      response = await _dio.post(
        url,
        data: body,
        options: Options(headers: headers),
        onSendProgress: onSendProgress,
      );
      return response;
    } on DioException catch (e) {
      EasyLoading.dismiss();
      _onErrorResponse(e);
    }
    return response;
  }

  Future<Response?> patch(String url,
      {Map<String, dynamic>? headers,
      Function(int, int)? onSendProgress,
      body,
      int cacheDays = 7,
      bool forceRefresh = true,
      ResponseType? responseType}) async {
    Response? response;
    try {
      response = await _dio.patch(
        url,
        data: body,
        // options: buildCacheOptions(
        //   Duration(days: cacheDays),
        //   forceRefresh: forceRefresh,
        //   maxStale: Duration(days: 10),
        //   options: Options(
        //     headers: headers,
        //     responseType: responseType,
        //   ),
        // ),
        onSendProgress: onSendProgress,
      );
      return response;
    } on DioException catch (e) {
      EasyLoading.dismiss();
      _onErrorResponse(e);
    }
    return response;
  }

  _onErrorResponse(DioException e) {
    if (e.response!.statusCode! >= 300 == true &&
        e.response!.statusCode! < 400 == true) {
      throw CustomException(e.response!.statusCode!,
          "Terjadi pengalihan yang tak terduga, silakan coba lagi dilain waktu, pastikan internet sedang dalam layanan!");
    } else if (e.response!.statusCode! >= 400 == true &&
        e.response!.statusCode! < 500 == true) {
      throw CustomException(e.response!.statusCode!,
          "Terjadi kesalahan pada klien, silakan coba lagi dilain waktu, pastikan internet sedang dalam layanan!");
    } else if (e.response!.statusCode! >= 500 == true &&
        e.response!.statusCode! < 600 == true) {
      throw CustomException(e.response!.statusCode!,
          "Terjadi kesalahan pada server atau layanan sedang tidak tersedia, silakan coba lagi dilain waktu, pastikan internet sedang dalam layanan!");
    }
    if (DioExceptionType.connectionTimeout == e.type) {
      throw CustomException(null, "Connection Timeout");
    } else if (DioExceptionType.receiveTimeout == e.type) {
      throw CustomException(null, "Error Timeout");
      // } else if (DioErrorType.response == e.type) {
    } else if (DioExceptionType.unknown == e.type) {
      if (e.message?.contains('SocketException') == true) {
        if (e.message?.contains('Failed host lookup') == true) {
          throw CustomException(null,
              "Terjadi kesalahan pada server atau layanan sedang tidak tersedia, silakan coba lagi dilain waktu, pastikan internet sedang dalam layanan!");
        } else if (e.message?.contains('Connection refused') == true) {
          throw CustomException(null,
              "Terjadi kesalahan pada klien, silakan coba lagi dilain waktu, pastikan internet sedang dalam layanan!");
        } else {
          throw CustomException(null, e.message);
        }
      } else {
        throw CustomException(null, e.message);
      }
    } else {
      throw CustomException(null,
          "Terjadi pengalihan yang tak terduga, silakan coba lagi dilain waktu, pastikan internet sedang dalam layanan!");
    }
  }
}
