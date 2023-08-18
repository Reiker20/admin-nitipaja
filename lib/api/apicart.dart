
import 'dart:convert';

import 'package:get/get.dart';

import '../controller/login_getx.dart';
import 'package:http/http.dart' as http;

class ApiCart{
  ControllerAuth c = Get.put(ControllerAuth());
  String link = 'https://shopper.nitipaja.online/api/';

  Future<List<dynamic>> getCategory() async {
    var result = await http.get(Uri.parse("${link}get-category"),);
    print(json.decode(result.body));
    print(c.token.toString());
    return json.decode(result.body);
  }
  Future<List<dynamic>> getSize() async {
    var result = await http.get(Uri.parse("${link}get-size"),);
    print(json.decode(result.body));
    print(c.token.toString());
    return json.decode(result.body);
  }

}