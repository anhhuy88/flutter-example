import 'dart:convert';
import 'package:http/http.dart' as http;

import 'configs_service.dart';

class HttpService {
  final urlBase = '';
  ConfigsService _configs;
  HttpService(this._configs);

  dynamic _handler(http.Response res) {
    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    }
    print(res.statusCode);
    // switch (res.statusCode) {
    //   default:
    // }
    return null;
  }

  Map<String, String> get _headers => {
        'Content-Type': 'application/json; charset=utf-8',
        'Accept': 'application/json',
        //'Authorization': 'Bearer ${this._configs.token}'
      };

  Future<dynamic> get(url) async {
    url = '$urlBase$url';
    final res = await http.get(url, headers: _headers);
    return _handler(res);
  }

  Future<dynamic> post(url, data) async {
    url = '$urlBase$url';
    final res = await http.post(url, headers: _headers, body: jsonEncode(data));
    return _handler(res);
  }

  Future<dynamic> put(url, data) async {
    url = '$urlBase$url';
    final res = await http.put(url, headers: _headers, body: data);
    return _handler(res);
  }

  Future<dynamic> delete(url) async {
    url = '$urlBase$url';
    final res = await http.delete(url, headers: _headers);
    return _handler(res);
  }
}
