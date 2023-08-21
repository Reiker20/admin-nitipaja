import 'package:flutter/material.dart';

import 'CreateAdmin.dart';

class User {
  final int id;
  final String name;
  final String email;
  final String role;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.role});
}

class AdminScreen extends StatelessWidget {
  final List<User> users = [
    // User(id: 1, name: 'John Doe', email: 'john@example.com', role: 'Admin'),
    // User(id: 2, name: 'Jane Smith', email: 'jane@example.com', role: 'User'),
    // ... add more users
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      appBar: AppBar(title: Text('User List')),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateUserScreen()),
                );
              },
              child: Text('+ Tambah Admin'),
            ),
          ),
          Card(
            margin: EdgeInsets.all(16),
            child: DataTable(
              columns: [
                DataColumn(label: Text('No')),
                DataColumn(label: Text('Profile')),
                DataColumn(label: Text('Nama')),
                DataColumn(label: Text('Email')),
                DataColumn(label: Text('Role')),
              ],
              rows: users.map((user) {
                return DataRow(cells: [
                  DataCell(Text('${user.id}')),
                  DataCell(
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // image: DecorationImage(
                        //   image: AssetImage(
                        //       'assets/profile.png'), // Replace with actual image
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                    ),
                  ),
                  DataCell(Text(user.name)),
                  DataCell(Text(user.email)),
                  DataCell(Text(user.role)),
                ]);
              }).toList(),
            ),
          ),
=======
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
>>>>>>> 9391f7a5634b3110d8bd6f6c59b58e61910c89a2
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AdminScreen(),
  ));
}
