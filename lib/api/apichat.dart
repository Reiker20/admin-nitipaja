import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../controller/login_getx.dart';

class APiChat{

  String link = 'https://shopper.nitipaja.online/api/';
  ControllerAuth c = Get.put(ControllerAuth());

  Future<Map<String, dynamic>> upMessage(Map<String, dynamic> body) async{
    var result =
    await http.post(Uri.parse("${link}send-message"),
        headers: {
          "Authorization": "Bearer ${c.token.toString()}",
          "accept": "application/json",
        },
      body: body
    );
    return json.decode(result.body)['data'];
  }

  Future<List<dynamic>> getMessage({id}) async {
    var result = await http.get(Uri.parse("${link}get-message/${id}"),
        headers: {
          "Authorization": "Bearer ${c.token.toString()}",
          "accept": "application/json",
        });
    print(json.decode(result.body)['msg'].toString());
    print(c.token.toString());
    return json.decode(result.body)['data'];
  }

  Future<List<dynamic>> getPeople() async {
    var result = await http.get(Uri.parse("${link}get-people-message"),
        headers: {
          "Authorization": "Bearer ${c.token.toString()}",
          "accept": "application/json",
        });
    print(json.decode(result.body)['msg'].toString());
    print(c.token.toString());
    return json.decode(result.body)['data'];
  }

  Stream<List<dynamic>> getMessageStream({id}) async* {
    var response = await http.get(Uri.parse("${link}get-message/${id}"),
        headers: {
          "Authorization": "Bearer ${c.token.toString()}",
          "accept": "application/json",
        });
    print(json.decode(response.body)['msg'].toString());
    print(c.token.toString());
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['data'];
      yield data;
    } else {
      throw Exception('Failed to load data from API');
    }
  }
}