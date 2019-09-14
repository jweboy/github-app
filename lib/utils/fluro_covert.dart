import 'dart:convert';

class FluroCovert {
  static String stringEncode(String originString) {
    return jsonEncode(Utf8Encoder().convert(originString));
  }

  static String stringDeCode(String enCodeString) {
    var list = List<int>();

    jsonDecode(enCodeString).forEach(list.add);

    String value = Utf8Decoder().convert(list);

    return value;
  }
}
