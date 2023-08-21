import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  final imageUrl = 'https://shopper.nitipaja.online/storage/images/profile.png';

  final List<Map<String, String>> usersData = [
    {'nama': 'Idgar Raka', 'email': 'Idgar Raka@gmail.com', 'role': 'Driver'},
    {'nama': 'Rania listasya', 'email': 'Rania listasya@gmail.com', 'role': 'Customer'},
    {'nama': 'Santika dewi', 'email': 'santika.dewi@gmail.com', 'role': 'Driver'},
    {'nama': 'Sandy falata', 'email': 'Sandy falata@gmail.com', 'role': 'Customer'},
    {'nama': 'Regantara', 'email': 'Regantara@gmail.com', 'role': 'Driver'},
    // {'nama': 'Revana', 'email': 'Revana@gmail.com', 'role': 'Customer'},
    // {'nama': 'Rendan', 'email': 'Rendan@gmail.com', 'role': 'Driver'},
    // {'nama': 'Fanya', 'email': 'Fanya@gmail.com', 'role': 'Customer'},
    // {'nama': 'Faisya', 'email': 'Faisya@gmail.com', 'role': 'Driver'},
    // {'nama': 'Enzano', 'email': 'sEnzano@gmail.com', 'role': 'Customer'},
    // Add more user objects with their respective roles
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(60, 60, 60, 0),
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 10)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Data User',
                    style: TextStyle(fontSize: 24, color: Colors.blue),
                  ),
                ),
                SizedBox(height: 20),
                DataTable(
                  columns: [
                    DataColumn(label: Text('No')),
                    DataColumn(label: Text('Profile')),
                    DataColumn(label: Text('Nama')),
                    DataColumn(label: Text('Email')),
                    DataColumn(label: Text('Role')),
                  ],
                  rows: usersData
                      .asMap()
                      .entries
                      .map(
                        (entry) => DataRow(
                          cells: [
                            DataCell(Text((entry.key + 1).toString())),
                            DataCell(CircleAvatar(
                              backgroundImage: NetworkImage(imageUrl),
                              radius: 20,
                            )),
                            DataCell(Text(entry.value['nama']!)),
                            DataCell(Text(entry.value['email']!)),
                            DataCell(
                              _buildRoleButton(entry.value['role']!),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoleButton(String role) {
    Color buttonColor;
    if (role == 'Driver') {
      buttonColor = Colors.red;
    } else if (role == 'Customer') {
      buttonColor = Colors.blue;
    } else {
      buttonColor = Colors.grey;
    }

    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(role),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: UserScreen(),
  ));
}
