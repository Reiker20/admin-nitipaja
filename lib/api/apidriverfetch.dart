import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../controller/login_getx.dart';

class APiFetch_Driver{

  String link = 'https://shopper.nitipaja.online/';
  ControllerAuth c = Get.put(ControllerAuth());
  Future<List<dynamic>> getDriver() async{
    var result =
    await http.get(Uri.parse("${link}api/driver"));
    // print(result.body);
    return json.decode(result.body);
  }
  Future<List<dynamic>> upDriver() async{
    var result =
    await http.post(Uri.parse("${link}api/driver"),
        headers: {
          "Authorization": "Bearer ${c.token.toString()}",
          "accept": "application/json",
        });
    return jsonDecode(result.body);
  }

  Future<List<dynamic>> upCustomer() async{
    var result =
    await http.post(Uri.parse("${link}api/customer"),
        headers: {
          "Authorization": "Bearer ${c.token.toString()}",
          "Accept": "application/json",
        });
    return jsonDecode(result.body);
  }

  Future<List<dynamic>> getCustomer() async{
    var result =
    await http.get(Uri.parse("${link}api/get-order"),
      headers: {
        "Authorization": "Bearer ${c.token.toString()}",
        "accept": "application/json",
      },
    );
    print(json.decode(result.body));
    return json.decode(result.body)['data'];
  }

  Future<List<dynamic>> orderDriver({id}) async{
    var result =
    await http.post(Uri.parse("${link}api/request-order/${id}"),
        headers: {
          "Authorization": "Bearer ${c.token.toString()}",
          "accept": "application/json",
        },
      // body: body
    );
    return jsonDecode(result.body);
  }

  Future<List<dynamic>> acceptCustomer({id}) async{
    var result =
    await http.post(Uri.parse("${link}api/accept-order/${id}"),
      headers: {
        "Authorization": "Bearer ${c.token.toString()}",
        "accept": "application/json",
      },
      // body: body
    );
    return jsonDecode(result.body);
  }

  Future<Map<String,dynamic>> getDriverOn() async{
    var result =
    await http.get(Uri.parse("${link}api/get-all-orders"),
      headers: {
        "Authorization": "Bearer ${c.token.toString()}",
        "accept": "application/json",
      },
    );
    print(json.decode(result.body));
    return json.decode(result.body)['driver'];
  }

  Future<String> getDriverStatus() async{
    var result =
    await http.get(Uri.parse("${link}api/get-mydriver"),
      headers: {
        "Authorization": "Bearer ${c.token.toString()}",
        "accept": "application/json",
      },
    );
    return json.decode(result.body)['msg'];
  }


}