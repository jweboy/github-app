import 'package:dio/dio.dart';

class Net {
  Dio dio = new Dio();

  fetch(url, params, {Options options}) async {
    if (options == null) {
      options = Options(method: 'get');
    }
    Response response;

    try {
      response = await dio.request(url, data: params, options: options);
    } on DioError catch (e) {}

    return response.data;
  }
}

final Net net = new Net();
