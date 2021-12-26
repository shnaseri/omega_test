import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

Map<String, String> header = {
  'Accept': 'application/json',
  'Content-Type': 'application/json; charset=utf-8',
  'apiKey': "F63CD7B1-EEDA-5D85-AAB1-B643E3E1D032"
};

class BaseNetworkService {
  String urlServer = "http://ebeheshtapi.omegadn.ir/api/v1";

  Future<dynamic>? postTemplate(String url, var body) async {
    try {
      var _body = convert.json.encode(body);
      http.Response response = await http.post(Uri.parse(urlServer + url),
          headers: header, body: _body);
      print(response.statusCode);
      ;
      print(response.body);
      print(header);
      if (response.statusCode == 200 || response.statusCode == 201) {
        String body = convert.utf8.decode(response.bodyBytes);
        var _jsonResponse = convert.jsonDecode(body);
        return _jsonResponse;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic>? getTemplate(String url, {Map<String, dynamic>? body}) async {
    try {
      String urlOfBody = '?';
      if (body != null) {
        body.forEach((key, value) {
          urlOfBody = urlOfBody + key + '=' + value + '&';
        });
      }
      http.Response response = await http
          .get(Uri.parse(urlServer + url + urlOfBody), headers: header);
      print(response.request?.url);
      print(response.body);
      if (response.statusCode == 200) {
        String body = convert.utf8.decode(response.bodyBytes);
        var _jsonResponse = convert.jsonDecode(body);
        return _jsonResponse;
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}