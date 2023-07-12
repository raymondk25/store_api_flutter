import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_api_flutter/consts/api_consts.dart';

class APIHandler {
  static Future<void> getAllProducts() async {
    Uri uri = Uri.https(kBaseUrl, "api/v1/products");
    var response = await http.get(uri);
    print("response: ${jsonDecode(response.body)}");
  }
}
