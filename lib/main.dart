import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:adminnitipaja/test.dart';
import 'firebase_options.dart';
import 'screens/Login_screen.dart';
import 'screens/Sidebar.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  // NotificationService().initNotification();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.grey
    ),
    home:
    LoginScreen()
    // SidebarPage()
  ));
}




