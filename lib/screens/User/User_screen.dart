import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(
              child: Container(
                width: 1063,
                height: 600,
                color: Colors.grey,
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Daftar Pengguna',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      height: 450, // Sesuaikan tinggi sesuai datanya
                      child: UserTable(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserTable extends StatefulWidget {
  @override
  _UserTableState createState() => _UserTableState();
}

class _UserTableState extends State<UserTable> {
  late Future<List<Map<String, dynamic>>> _usersData;

  @override
  void initState() {
    super.initState();
    _usersData = getUsersData();
  }

  Future<List<Map<String, dynamic>>> getUsersData() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('User').get();

    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _usersData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final userList = snapshot.data!;
          return DataTable(
            columns: [
              DataColumn(label: Text('No')),
              DataColumn(label: Text('Photo')),
              DataColumn(label: Text('Email')),
              DataColumn(label: Text('Role')),
            ],
            rows: userList
                .asMap()
                .map((index, userData) {
                  String role = userData['status'] == true ? 'Jastiper' : 'Customer';
                  return MapEntry(
                    index,
                    DataRow(
                      cells: [
                        DataCell(Text((index + 1).toString())),
                        DataCell(
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                userData['https://shopper.nitipaja.online/storage/images/Boy.png'] ?? ''),
                          ),
                        ),
                        DataCell(Text(userData['email'] ?? '')),
                        DataCell(Text(role)), 
                      ],
                    ),
                  );
                })
                .values
                .toList(),
          );
        }
      },
    );
  }
}

void main() {
  runApp(MaterialApp(home: UserScreen()));
}
