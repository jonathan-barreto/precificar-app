import 'package:dio/dio.dart';

class HttpClient {
  final Dio _dio;

  HttpClient({required Dio dio}) : _dio = dio;

  Future<Response> get({required String endpoint}) {
    return _dio.get(endpoint);
  }

  Future<Response> post({required String endpoint, Object? data}) {
    return _dio.post(
      endpoint,
      data: data,
    );
  }
}
