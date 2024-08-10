import 'dart:convert';

import 'package:http/http.dart';
import 'package:get/get.dart';
import 'package:r_store/const/url_const.dart';

class ClientApi {
  GetConnect client = Get.find();

  Future<dynamic> postData(
      String url, dynamic body, Map<String, String> header) async {
    var bodyJson = jsonEncode(body);
    print(bodyJson);
    var response =
        await client.post(baseUrlApi + url, bodyJson, headers: header);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      return response.body;
    } else
      throw ClientException(response.body["error"]);
  }

  Future<dynamic> getData(String url, Map<String, String> header) async {
    //{"Authorization": "Bearer $token"}
    var response = await client.get(baseUrlApi + url, headers: header);
    if (response.statusCode == 200) {
      return response.body;
    } else
      throw Exception(response.body["error"]);
  }
}
