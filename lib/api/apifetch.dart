import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../config/palette.dart';
import '../controller/login_getx.dart';
import '../navbar/Sidebar_menu.dart';


class APiFetch_Authentication {

  ControllerAuth c = Get.put(ControllerAuth());
  String link = 'https://shopper.nitipaja.online/api/';

  Future<Map<String, dynamic>> fetchUser() async {
    var result =
    await http.get(Uri.parse("https://shopper.nitipaja.online/api/profile"),
        headers: {
        "Authorization": "Bearer ${c.token.toString()}",
        "accept": "application/json",
        });
    print(jsonDecode(result.body)['data']);
    Map<String, dynamic> failed = {'failed': true};
    if(result.statusCode==200) return jsonDecode(result.body)['data'];
    return failed;
  }
  Future<dynamic> fetchUserAccess() async {
    var result =
    await http.get(Uri.parse("https://shopper.nitipaja.online/api/profile"),
        headers: {
        "Authorization": "Bearer ${c.token.toString()}",
        "accept": "application/json",
        });
    print(jsonDecode(result.body)['access']);
    return jsonDecode(result.body)['access'];
  }

  Future<String> LogOutUser(Map<String, dynamic> body,{token}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var result =
    await http.post(Uri.parse("https://shopper.nitipaja.online/api/logout"),
        headers: {
          "accept": "application/json",
          "Authorization": "Bearer ${token}"
        },
      body: body
    );
    prefs.remove('token');
    return result.body;
  }

  Future<dynamic> LoginData(Map<String, dynamic> body, password, context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http.post(
      Uri.parse('https://shopper.nitipaja.online/api/login'),
      body: body,
    );

    if (response.statusCode == 200) {
      print(response.body);
      String token = jsonDecode(response.body)['access_token'];
      c.token = token.obs;
      c.password = password.toString().obs;
      print('${c.token.toString()}');
      prefs.setString('token', token);
      prefs.setString('password', password);
      print('true');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SidebarMenu(),));
    }else{
      print('invalid');
      toast(text: 'invalid');
    }
    return json.decode(response.body)['access'];
  }
  toast({text}){
    return Fluttertoast.showToast(
        backgroundColor: Palette.activeColor,
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  Future<dynamic> LoginGoogle(Map<String, dynamic> body, password, context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http.post(
      Uri.parse('${link}google'),
      body: body,
    );
    if (response.statusCode == 200) {
      print(response.body);
      String token = jsonDecode(response.body)['access_token'];
      c.token.value = token;
      c.password.value = password;
      print('${c.token.toString()}');
      prefs.setString('token', token);
      prefs.setString('password', password);
      print('true');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SidebarMenu(),));
    }else{
      print('invalid');
      toast(text: 'invalid');
    }
    return json.decode(response.body)['access'];
  }


  Future<String> RegistData(Map<String, dynamic> body,) async {
    final response = await http.post(
      Uri.parse('${link}register'),
      body: body,
    );
    print(response.body);
    return response.body;
  }

  Future<List<dynamic>> getallUser() async{
    var result =
    await http.get(Uri.parse("${link}get-users"));
    return json.decode(result.body)['data'];
  }

  Future<String> ChangePassword(Map<String, dynamic> body, {id}) async {
    final response = await http.post(
      Uri.parse('${link}update_password/${id}'),
        headers: {
          "Authorization": "Bearer ${c.token.toString()}",
          "accept": "application/json",
        },
      body: body,
    );
    print(response.body);
    return response.body;
  }

  Future<String> UpdateProfile(Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse('${link}update'),
        headers: {
          "Authorization": "Bearer ${c.token.toString()}",
          "accept": "application/json",
        },
      body: body,
    );
    print(response.body);
    return response.body;
  }

  Future<String> sendVerification(Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse('${link}verification-notification'),
      headers: {
        "Authorization": "Bearer ${c.token.toString()}",
        "accept": "application/json",
      },
      body: body,
    );
    print(response.body);
    return response.body;
  }
  }


