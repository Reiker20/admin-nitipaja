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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          // Search Bar
          Container(
            width: 200,
            margin: EdgeInsets.only(right: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                suffixIcon: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    color: Colors.blue, // Ganti dengan warna yang diinginkan
                  ),
                  height: 24,
                  width: 24,
                  child: Icon(Icons.search, color: Colors.white),
                ),
              ),
              onChanged: (value) {
                // Handle onChanged event here
              },
            ),
          ),
          SizedBox(width: 16),
          // Dropdown Profil
          DropdownButton<String>(
            items: ['Logout']
                .map((String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ))
                .toList(),
            onChanged: (String? newValue) {
              // Handle onChanged event here
            },
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}