import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/shopper-89651.appspot.com/o/shopper.png?alt=media&token=904b0686-8db5-4f59-b655-7eb2349f4280',
                      height: 240,
                      width: 250,
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Masuk',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
      ),
    );
  }
}