import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';

// base option
BaseOptions options = new BaseOptions(
    // baseUrl: 'https://api.github.com',
    connectTimeout: 5000,
    receiveTimeout: 3000,
    contentType: ContentType.parse("application/x-www-form-urlencoded"),
    headers: {
      'Authorization': 'Bear 0b157832d5acd5e87b1108af17002bb3788dc947',
    });

// dio instance
Dio dio = new Dio(options);

class Net {
  static Future get(String url, {Map<String, dynamic> params}) async {
    Response response = await dio.get(url);

    return response.data;
  }

  static Future patch(String url, Map<String, dynamic> params) async {
    Response response = await dio.patch(url, data: params);

    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      print('options ... $options');
      // 在请求被发送之前做一些事情
      return options; //continue
      // 如果你想完成请求并返回一些自定义数据，可以返回一个`Response`对象或返回`dio.resolve(data)`。
      // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data.
      //
      // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象，或返回`dio.reject(errMsg)`，
      // 这样请求将被中止并触发异常，上层catchError会被调用。
    }, onResponse: (Response response) {
      print('response ... $response');
      // 在返回响应数据之前做一些预处理
      return response; // continue
    }, onError: (DioError e) {
      print('e ... $e');
      // 当请求失败时做一些预处理
      return e; //continue
    }));

    return response.data;
  }
}
