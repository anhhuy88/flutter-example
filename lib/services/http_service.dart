import 'dart:convert';
import 'package:http/http.dart' as http;

import 'configs_service.dart';
import 'dialog_service.dart';

class HttpService {
  final urlBase = 'http://rethink.kloon.vn:8920/api/basedata/api/v1';
  ConfigsService _configs;
  HttpService(this._configs);

  Future<dynamic> _handler(http.Response res) {
    if (res.statusCode == 200) {
      return res.body.length < 1
          ? new Future.value()
          : new Future.value(json.decode(res.body.toString()));
    }
    print(res.statusCode);
    print(res.body);
    final msg = res.body;
    // switch (res.statusCode) {
    //   default:
    //     _dialog.alert(res.body);
    //     break;
    // }
    return new Future.error(msg);
  }

  Map<String, String> get _headers => {
        'Content-Type': 'application/json; charset=utf-8',
        'Accept': 'application/json',
        'TenantId': '9c9726f7-5d61-4661-9248-1a10aa228c20',
        'Accept-Language': 'en-US'
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
