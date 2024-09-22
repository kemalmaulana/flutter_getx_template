import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_getx_template/core/core/alice/alice_get_connect.dart';
import 'package:flutter_getx_template/core/core/constant/app_constant.dart';
import 'package:flutter_getx_template/data/storage.dart';
import 'package:get/get.dart';

class NetworkCore extends GetConnect {
  static final noNeedToken = ['/login'];

  static bool isNeedToken(String route) => !noNeedToken.contains(route);

  final storage = StorageCore();
  final alice = Get.find<AliceGetConnect>();

  @override
  void onInit() {
    httpClient.baseUrl = AppConstant.baseUrl;
    httpClient.defaultContentType = 'application/json';
    httpClient.timeout = alice.timeout;
    httpClient.addRequestModifier(alice.requestInterceptor);
    httpClient.addResponseModifier(alice.responseInterceptor);
    super.onInit();
  }

  Future<Response<dynamic>?> getRequest<T>(String url,
      {Map<String, String>? headers,
      Map<String, dynamic>? queryParameters,
      int cacheDays = 7,
      required T Function(dynamic) decoder,
      bool forceRefresh = true}) async {
    Response<dynamic>? response;
    try {
      response = await get<T>(url,
          headers: headers, query: queryParameters,
          decoder: decoder
      );
    } on Exception catch (_) {
      EasyLoading.dismiss();
      rethrow;
    }
    return response;
  }

  Future<Response<dynamic>?> postRequst<T>(
    String url, {
    Map<String, String>? headers,
    Function(double)? onSendProgress,
    dynamic body,
    int cacheDays = 7,
    required T Function(dynamic) decoder,
    bool forceRefresh = true,
  }) async {
    Response<dynamic>? response;
    try {
      response = await post<T>(
        url,
        body,
        headers: headers,
        contentType: 'application/json',
        decoder: decoder,
        uploadProgress: onSendProgress,
      );
      return response;
    } on Exception catch (_) {
      EasyLoading.dismiss();
      rethrow;
    }
  }

  Future<Response<dynamic>?> patchRequest<T>(String url,
      {Map<String, dynamic>? headers,
      Function(double)? onSendProgress,
      dynamic body,
      int cacheDays = 7,
      required T Function(dynamic) decoder,
      bool forceRefresh = true}) async {
    Response<dynamic>? response;
    try {
      response = await patch(
        url,
        body,
        decoder: decoder,
        uploadProgress: onSendProgress,
      );
      return response;
    } on Exception catch (_) {
      EasyLoading.dismiss();
      // _onErrorResponse(e);
      rethrow;
    }
  }
}
