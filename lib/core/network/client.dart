import 'package:dio/dio.dart';

class Client {
  final Dio dio;

  Client({
    required this.dio,
  });

  Future<dynamic> get(String url, {Map<String, String>? headers}) async {
    dio.options.headers = headers;
    Response response = await dio.get(
      url,
    );
    return response;
  }
}
