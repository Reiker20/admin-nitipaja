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
