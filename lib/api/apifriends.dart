import 'dart:convert';

import 'package:get/get.dart';

import '../controller/login_getx.dart';
import 'package:http/http.dart' as http;

class ApiFetchFriends{
  ControllerAuth c = Get.put(ControllerAuth());
  String link = 'https://shopper.nitipaja.online/api/';

  Future<List<dynamic>> getNotify({id}) async {
    var result =
    await http.get(Uri.parse("${link}get-request-notify"),
        headers: {
          "Authorization": "Bearer ${c.token.toString()}",
          "accept": "application/json",
        });
    return json.decode(result.body)['data'];
  }

  Future<List<dynamic>> acceptRequest({id}) async {
    var result =
    await http.post(Uri.parse("${link}accept-friend/${id}"),
        headers: {
          "Authorization": "Bearer ${c.token.toString()}",
          "accept": "application/json",
        });
    print(json.decode(result.body)['result']);
    return json.decode(result.body)['result'];
  }

  Future<List<dynamic>> getFriends() async {
    var result = await http.get(Uri.parse("${link}get-friends"),
        headers: {
          "Authorization": "Bearer ${c.token.toString()}",
          "accept": "application/json",
        });
    print(json.decode(result.body)['get']);
    return json.decode(result.body)['get'];
  }

  Future<List<dynamic>> sendRequest(Map<String, dynamic> body) async {
    var result =
    await http.post(Uri.parse("${link}request-friend"),
        headers: {
          "Authorization": "Bearer ${c.token.toString()}",
          "accept": "application/json",
        },
      body: body,
        );
    print(json.decode(result.body)['result']);
    return json.decode(result.body)['result'];
  }

}