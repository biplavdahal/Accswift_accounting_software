import 'package:accswift/core/logger.dart';
import 'package:accswift/services/api_service.dart';
import 'package:dio/dio.dart';

class ApiServiceImplementation
    with CustomLogger<ApiServiceImplementation>
    implements ApiService {
  late Dio _dio;

  @override
  void call({
    required String baseUrl,
    String contentType = 'application/json',
    Map<String, dynamic>? headers,
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        contentType: contentType,
        headers: headers,
      ),
    );
  }

  @override
  Map<String, dynamic> get headers => _dio.options.headers;

  @override
  void setHeaders(String key, String value) {
    if (_dio.options.headers.containsKey(key)) {
      _dio.options.headers[key] = value;
    } else {
      _dio.options.headers.putIfAbsent(key, () => value);
    }

    verbose('Header Set => $key: $value => ${_dio.options.headers}');
  }

  @override
  Future<Response> get(String point, {Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.get(
        point,
        queryParameters: params,
      );

      verbose(
          'GET => $point <-> (${response.headers}) <-> $params [${response.statusCode}] =>  ${response.data}');

      return response;
    } catch (e) {
      if (e is DioError) {
        problem(
            'GET => $point <-> (${e.response?.headers}) <-> $params [${e.response?.statusCode}] =>  ${e.response?.data}');
      }

      rethrow;
    }
  }

  @override
  Future<Response> put(
    String point, {
    dynamic body,
    Map<String, dynamic>? params,
  }) async {
    try {
      final response = await _dio.put(
        point,
        data: body,
        queryParameters: params,
      );

      verbose(
          'PUT => $point <-> (${response.headers}) <-> $params {$body} [${response.statusCode}] =>  ${response.data}');

      return response;
    } catch (e) {
      if (e is DioError) {
        problem(
            'PUT => $point <-> (${e.response?.headers}) <-> $params {$body} [${e.response?.statusCode}] =>  ${e.response?.data}');
      }
      rethrow;
    }
  }

  @override
  Future<bool> delete(String point,
      {dynamic body, Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.delete(
        point,
        data: body,
        queryParameters: params,
      );

      verbose(
          'DELETE => $point <-> (${response.headers}) <-> $params {$body} [${response.statusCode}] =>  ${response.data}');

      return response.statusCode == 200;
    } catch (e) {
      if (e is DioError) {
        problem(
            'DELETE => $point <-> (${e.response?.headers}) <-> $params {$body} [${e.response?.statusCode}] =>  ${e.response?.data}');
      }
      rethrow;
    }
  }

  @override
  Future<Response> patch(
    String point, {
    dynamic body,
    Map<String, dynamic>? params,
  }) async {
    try {
      final response = await _dio.patch(
        point,
        data: body,
        queryParameters: params,
      );

      verbose(
          'PATCH => $point <-> (${response.headers}) <-> $params {$body} [${response.statusCode}] =>  ${response.data}');

      return response;
    } catch (e) {
      if (e is DioError) {
        problem(
            'PATCH => $point <-> (${e.response?.headers}) <-> $params {$body} [${e.response?.statusCode}] =>  ${e.response?.data}');
      }
      rethrow;
    }
  }

  @override
  Future<Response> post(
    String point, {
    dynamic body,
    Map<String, dynamic>? params,
    bool asFormData = false,
  }) async {
    try {
      final response = await _dio.post(
        point,
        data: asFormData ? FormData.fromMap(body) : body,
        queryParameters: params,
      );

      verbose(
          'POST => $point <-> (${response.headers}) <-> $params {$body} [${response.statusCode}] =>  ${response.data}');

      return response;
    } catch (e) {
      if (e is DioError) {
        problem(
            'POST => $point <-> (${e.response?.headers}) <-> $params {$body} [${e.response?.statusCode}] =>  ${e.response?.data}');
      }
      rethrow;
    }
  }
}
