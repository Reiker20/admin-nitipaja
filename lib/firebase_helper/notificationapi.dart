
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../controller/login_getx.dart';

class Firebase_API{
  ControllerAuth c_auth = Get.put(ControllerAuth());
  var db =  FirebaseFirestore.instance.collection('Token');

  Future<int> notify_api({id, content}) async {
    var stream = await db.get();
    List token = [];
    List data = stream.docs.map((DocumentSnapshot document) {
      return document.data()! as Map<String, dynamic>;}).toList();
    data.forEach((element) {
      if(element['token'].toString()==id){
        token.add('${element['user_code'].toString()}');
      }
    });
    Map<String,dynamic> notification = {
      "body":"you have new request $content   ",
      "title": "shopper notify",
      "sound":true,
    };
    Map<String,dynamic> body = {
      "registration_ids": token,
      "notification": notification
    };
    Map<String,String> headers = {
      'Authorization': 'key=AAAA7lwMGTY:APA91bHstjslQpxzLcB7Aoyf5YjOHmHEBAfbkzOZjXSNn2n0Ms-bbjgu9xYxPy1eSEHwIk7V2OE6ox7u7VZXP5aoQatUVU_EtbjyEogh-36KQwdRRSWNDC5-PQn6zVH3S2izexTHroAP',
      'Content-Type': 'application/json'
    };

  final response = await http.post(
    Uri.parse('https://fcm.googleapis.com/fcm/send'),
    headers: headers,
    body: jsonEncode(body),
  );
  print(body.toString());
  print(response.statusCode.toString());
  print(response.body.toString());
  return response.statusCode;
}

}