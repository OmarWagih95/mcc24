import 'dart:convert';

import 'package:http/http.dart' as http;

class DataServices {
  String baseUrl = '';
  getinfo() async {
    String apiUrl = '';
    http.Response res = await http.get(Uri.parse(baseUrl + apiUrl));
    try {
      if (res.statusCode == 200) {
        List<dynamic> list=jsonDecode(res.body);
      }
    } catch (e) {
      print(e);
    }
  }
}
