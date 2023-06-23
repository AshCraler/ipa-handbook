import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart';

final log = Logger(
  printer: PrettyPrinter(
    methodCount: 1,
    lineLength: 110,
  ),
);

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String headerMessage = "";
    options.headers.forEach((k, v) => headerMessage += '► $k: $v\n');
    String queryParams = "";
    try {
      options.queryParameters.forEach((k, v) => queryParams += ' ► $k: $v\n');
    } catch (_) {}
    String prettyJson = "";
    try {
      if (options.data is FormData) {
        FormData formData = options.data;
        for (MapEntry<String, String> field in formData.fields) {
          prettyJson += "${field.key}: ${field.value}, ";
        }
        prettyJson = prettyJson.trim();
        prettyJson = "{${prettyJson.substring(0, prettyJson.length - 1)}}";
      } else {
        const JsonEncoder encoder = JsonEncoder.withIndent('  ');
        prettyJson = encoder.convert(options.data);
      }
    } catch (e) {
      log.e("Failed to extract json request $e");
      // Crashlytics.nonFatalError(
      //   error: e,
      //   reason: "Failed to extract json request",
      // );
    }
    log.d(
      // ignore: unnecessary_null_comparison
      "REQUEST ► ︎ ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${"${options.baseUrl}${options.path}"}\n\n"
      // "Headers:\n"
      // "$headerMessage\n"
      "❖ Params: \n"
      "$queryParams"
      "❖ Body data: $prettyJson",
    );
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log.e(
      "<-- ${err.message} ${err.response?.requestOptions != null ? (err.response!.requestOptions.baseUrl + err.response!.requestOptions.path) : 'URL'}\n\n"
      "${err.response != null ? err.response!.data : 'Unknown Error'}",
    );

    // Crashlytics.nonFatalError(
    //   error: dioError.error,
    //   stackTrace: dioError.stackTrace,
    //   reason: "Failed to fetch data",
    // );
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    String headerMessage = "";
    response.headers.forEach((k, v) => headerMessage += '► $k: $v\n');

    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    final String prettyJson =
        encoder.convert(response.data).replaceAll("\n", " ").replaceAll(" ", "");

    log.d(
      // ignore: unnecessary_null_comparison
      "◀ ︎RESPONSE ${response.statusCode} ${response.requestOptions != null ? (response.requestOptions.baseUrl + response.requestOptions.path) : 'URL'}\n\n"
      // "Headers:\n"
      // "$headerMessage\n"
      "❖ Results : \n"
      "Response: $prettyJson",
    );
    super.onResponse(response, handler);
  }
}
