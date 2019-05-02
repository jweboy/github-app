import 'dart:async';
import 'package:dio/dio.dart';

// base option
BaseOptions options = new BaseOptions(
  baseUrl: 'https://api.github.com',
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

// dio instance
Dio dio = new Dio(options);

class Net {
  static Future get(String url, { Map<String, dynamic> params }) async {
    Response response = await dio.get(url);

    return response.data;
  }
}