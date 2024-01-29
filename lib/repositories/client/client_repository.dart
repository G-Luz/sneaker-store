import 'package:dale_poc/constants/endpoints.dart';
import 'package:dale_poc/utils/mappers.dart';
import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';

part 'client_repository.g.dart';

class ClientRepository = _ClientRepositoryBase with _$ClientRepository;

abstract class _ClientRepositoryBase with Store {
  final dio = Dio();

  Future<T?> get<T>({
    required String endpoint,
    required JsonMapper<T> jsonMapper,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.get<Map<String, dynamic>>(
      '${Endpoints.baseURL}$endpoint',
      queryParameters: queryParameters,
    );

    print('API response: $response');
    if (response.data != null) {
      return jsonMapper(response.data!);
    }
    return null;
  }

  Future<T?> getLists<T>({
    required String endpoint,
    required ListMapper<T> listMapper,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.get<List<dynamic>>(
      '${Endpoints.baseURL}$endpoint',
      queryParameters: queryParameters,
    );
    if (response.data != null) {
      return listMapper(response.data!);
    }
    return null;
  }

  Future<Response<T>?> post<T>({
    required String endpoint,
    Map<String, dynamic>? bodyMapper,
    Map<String, dynamic>? queryMapper,
  }) async {
    try {
      print('Endpoint: $endpoint');
      print('Body Mapper: $bodyMapper');
      final response = await dio.post<T>('${Endpoints.baseURL}$endpoint',
          data: bodyMapper,
          queryParameters: queryMapper,
          options: Options(
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
          ));
      return response;
    } on DioException catch (e) {
      print('Request error: $e');
      return null;
    }
  }

  Future<T?> mappedPost<T>({
    required String endpoint,
    required JsonMapper<T> jsonMapper,
    Map<String, dynamic>? bodyMapper,
    Map<String, dynamic>? queryMapper,
  }) async {
    try {
      print('Endpoint: $endpoint');
      print('Body Mapper: $bodyMapper');
      final response =
          await dio.post<Map<String, dynamic>>('${Endpoints.baseURL}$endpoint',
              data: bodyMapper,
              queryParameters: queryMapper,
              options: Options(
                contentType: Headers.jsonContentType,
                responseType: ResponseType.json,
              ));

      if (response.data != null) {
        return jsonMapper(response.data!);
      }
      return null;
    } on DioException catch (e) {
      print('Request error: $e');
      return null;
    }
  }

  Future<Response<T>?> put<T>({
    required String endpoint,
    Map<String, dynamic>? bodyMapper,
    Map<String, dynamic>? queryMapper,
  }) async {
    try {
      print('Endpoint: $endpoint');
      print('Body Mapper: $bodyMapper');
      final response = await dio.put<T>('${Endpoints.baseURL}$endpoint',
          data: bodyMapper,
          queryParameters: queryMapper,
          options: Options(
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
          ));
      return response;
    } on DioException catch (e) {
      print('Request error: $e');
      return null;
    }
  }

  Future<Response<T>?> delete<T>({
    required String endpoint,
    Map<String, dynamic>? bodyMapper,
    Map<String, dynamic>? queryMapper,
  }) async {
    try {
      print('Endpoint: $endpoint');
      print('Body Mapper: $bodyMapper');
      final response = await dio.delete<T>(
        '${Endpoints.baseURL}$endpoint',
        data: bodyMapper,
        queryParameters: queryMapper,
        options: Options(
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ),
      );
      return response;
    } on DioException catch (e) {
      print('Request error: $e');
      return null;
    }
  }
}
