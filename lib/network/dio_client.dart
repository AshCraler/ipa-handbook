import 'dart:developer' as dev;

import 'package:dio/dio.dart';
import '../config/env/app_env.dart';
import 'dio_interceptor.dart';

class DioClient {
  String get baseUrlTest {
    final url = AppEnv.HOST_URL;
    return url;
  }

  late Dio _dio;

  DioClient() {
    _dio = _createDio();
    _dio.interceptors.add(DioInterceptor());
  }

  Dio get dio => _dio;

  Dio _createDio() => Dio(
      // BaseOptions(
      //   baseUrl: baseUrl,
      //   headers: {
      //     'Content-Type': 'application/json',
      //     'Accept': 'application/json',
      //     if (_auth != null) ...{
      //       'Authorization': _auth,
      //     },
      //   },
      //   receiveTimeout: 60000,
      //   connectTimeout: 60000,
      //   validateStatus: (int? status) {
      //     return status! > 0;
      //   },
      // ),
      );

  Future<Response<T>> getRequest<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await dio.get<T>(baseUrlTest + url,
          queryParameters: queryParameters);
    } on DioException catch (e) {
      dev.log("DIO CLIENT DioError ${e.toString()}");
      throw Exception(e.message);
    }
  }

  Future<Response<T>> postRequest<T>(
    String url, {
    Map<String, dynamic>? parameters,
    required Map<String, dynamic> data,
  }) async {
    try {
      var formData = FormData.fromMap(data);
      return await dio.post<T>(
        url,
        queryParameters: parameters,
        data: formData,
      );
    } on DioException catch (e) {
      dev.log("DIO CLIENT DioError ${e.toString()}");
      throw Exception(e.message);
    }
  }
}
