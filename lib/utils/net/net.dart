import 'package:dio/dio.dart';

class Net {
  Dio dio = new Dio();

  fetch(url, {params, queryParameters, Options options}) async {
    if (options == null) {
      options = Options(method: 'get');
    }
    Response response;

    try {
      response = await dio.request(url,
          data: params, queryParameters: queryParameters, options: options);
    } on DioError catch (e) {}

    return response.data;
  }
}

final Net net = new Net();
