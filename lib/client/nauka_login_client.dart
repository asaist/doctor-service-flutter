import 'dart:convert';

import 'package:http/http.dart' as http;

class NaukaLoginClient {
  static Future<int> login(String login, String password) async {
    final response = await http.post(
      Uri.parse('http://172.16.0.251:8081/api/user/login'),
      headers: {
        'Access-Control-Allow-Origin': '172.16.0.251',
        "content-type": "application/json",
      },
      body: jsonEncode(
        <String, dynamic>{
          'login': login,
          'password': password,
        },
      ),
    );
    if (response.statusCode == 200) {
      return int.parse(response.body);
    } else {
      return 0;
    }
  }
}
