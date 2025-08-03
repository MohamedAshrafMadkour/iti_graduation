import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});
  String baseUrl = 'https://api.themoviedb.org/3/';
  Future get({
    required String endPoint,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    var response = await dio.get(
      baseUrl + endPoint,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      queryParameters: query,
    );
    return response.data;
  }
}
