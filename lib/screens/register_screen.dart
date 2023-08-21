import 'dart:math';

import 'package:adminnitipaja/navbar/Sidebar_menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
// import 'package:nitip/settings/profile/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../PushNotify/notifyservice.dart';
import '../config/palette.dart';
import '../controller/login_getx.dart';
import '../navbar/Sidebar_menu.dart';
import '../api/apifetch.dart';
import 'Login_screen.dart';
import 'Sidebar.dart';
import 'register_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'forgot_password.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNoController = TextEditingController();
  final _birthOfDateController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final _genderController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _phoneNoController.dispose();
    _birthOfDateController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    _genderController.dispose();
    super.dispose();
  }

  Future signUp() async{
    if (passwordConfirmed()) {
      // create user
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim());
      // add user detail
      addUserDetails(
        _usernameController.text.trim(),
        _emailController.text.trim(),
        _birthOfDateController.text.trim(),
        _genderController.text.trim(),
        _passwordController.text.trim(),
        int.parse(_phoneNoController.text.trim()),
      );
    }
  }

  Future addUserDetails(String username, String email, String birthOfDate, String gender, String password, int phoneNo) async{
    await FirebaseFirestore.instance.collection('UserAdmin').add({
      'username' : username,
      'email' : email,
      'birthOfDate' : birthOfDate,
      'gender' : gender,
      'phoneNo' : phoneNo,
      'password' : password,
    });
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() == _passwordConfirmController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Image.asset('assets/images/shopper.png', height: 130,),
                SizedBox(height: 20),
                Text(
                  'DAFTAR',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  height: 600,
                  width: 440,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 5),
                      TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.activeColor),
                            borderRadius: BorderRadius.circular(50),
                          ), 
                          hintText: 'Username',
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(Icons.person, color: Colors.grey,),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.activeColor),
                            borderRadius: BorderRadius.circular(50),
                          ), 
                          hintText: 'Email',
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(Icons.email, color: Colors.grey,),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: _phoneNoController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.activeColor),
                            borderRadius: BorderRadius.circular(50),
                          ), 
                          hintText: 'Nomor Hp',
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(Icons.phone, color: Colors.grey,),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: _birthOfDateController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.activeColor),
                            borderRadius: BorderRadius.circular(50),
                          ), 
                          hintText: 'Tanggal Lahir',
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(Icons.date_range, color: Colors.grey,),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.activeColor),
                            borderRadius: BorderRadius.circular(50),
                          ), 
                          hintText: 'Password',
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(Icons.lock, color: Colors.grey,),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: _passwordConfirmController,
                        obscureText: true,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.activeColor),
                            borderRadius: BorderRadius.circular(50),
                          ), 
                          hintText: 'Konfirmasi Password',
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(Icons.lock, color: Colors.grey,),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: _genderController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.activeColor),
                            borderRadius: BorderRadius.circular(50),
                          ), 
                          hintText: 'Jenis Kelamin',
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(FontAwesomeIcons.venusMars, color: Colors.grey,),
                        ),
                      ),
                      SizedBox(height: 50),
                      Container(
                        height: 50,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Palette.activeColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: TextButton(
                          onPressed: () {
                            if (_usernameController.text.trim() == '' || _emailController.text.trim() == '' || _birthOfDateController.text.trim() == '' || _passwordController.text.trim() == '' || _genderController.text.trim() == '' || _phoneNoController.text.trim() == '' || _passwordConfirmController.text.trim() == '') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Mohon isi semua data'),
                                ),
                              );
                            } else if (passwordConfirmed() == false) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Password tidak sama'),
                                ),
                              );
                            } else {
                              addUserDetails(_usernameController.text.trim(), _emailController.text.trim(), _birthOfDateController.text.trim(), _genderController.text.trim(), _passwordController.text.trim(), int.parse(_phoneNoController.text.trim()));
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Berhasil mendaftar'),
                                ),
                              );
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()),);
                            }
                          },
                          child: Center(
                            child: Text(
                              'Daftar',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(height: 30),
                      // google(),
                    ],
                  ),
                ),
                // SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sudah punya akun?',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 5),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()),);
                      },
                      child: Text(
                        'Masuk',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Palette.activeColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
  
}
