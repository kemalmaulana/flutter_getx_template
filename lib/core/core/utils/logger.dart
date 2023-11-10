import 'package:fimber/fimber.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class Logger {
  static logResponse(dynamic response) {
    Fimber.i("Response: ${response.data}");
    Fimber.i("<-- END HTTP");
  }

  // static logError(Request dioError) {
  //   Fimber.i(
  //       "<-- ${dioError.message} ${((dioError.requestOptions.path))}");
  //   Fimber.i(
  //       "${dioError.response != null ? dioError.response?.data : 'Unknown Error'}");
  //   Fimber.i("<-- End error");
  // }

  static logRequest(Request options) {
    Fimber.i(
        "--> ${options.method.toUpperCase()} ${"${options.url.host}${options.url.path}"}");
    Fimber.i("Headers:");
    Fimber.i("URL : ${options.url.origin}");
    options.headers.forEach((k, v) => Fimber.i('$k: $v'));
    Fimber.i("queryParameters:");
    options.url.queryParameters.forEach((k, v) => Fimber.i('$k: $v'));
    if (options.url.data != null) {
      Fimber.i("Body: ${options.url.data}");
    }
    Fimber.i(
        "--> END ${options.method.toUpperCase()}");
  }
}
