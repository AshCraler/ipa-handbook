import 'dart:developer' as dev;

import 'package:dio/dio.dart';
import '../config/env/app_env.dart';
import 'dio_interceptor.dart';

class DioClient {
  static String get baseUrlTest {
    return AppEnv.HOST_URL;
  }

  late Dio _dio;

  DioClient._() {
    _dio = _createDio();
    _dio.interceptors.add(DioInterceptor());
  }

  static DioClient get instance => DioClient._();

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

  Future<T> getRequest<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return (await dio.get<T>(
        baseUrlTest + url,
        queryParameters: queryParameters,
      ))
          .data!;
    } on DioException catch (e) {
      dev.log("DIO CLIENT DioError ${e.toString()}");
      throw Exception(e.message);
    }
  }

  Future<T> postRequest<T>(
    String url, {
    Map<String, dynamic>? parameters,
    required Map<String, dynamic> data,
  }) async {
    try {
      var formData = FormData.fromMap(data);
      return (await dio.post<T>(
        url,
        queryParameters: parameters,
        data: formData,
      ))
          .data!;
    } on DioException catch (e) {
      dev.log("DIO CLIENT DioError ${e.toString()}");
      throw Exception(e.message);
    }
  }
}
