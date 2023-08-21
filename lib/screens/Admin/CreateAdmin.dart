import 'package:flutter/material.dart';


class CreateUserScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();

  void _onSubmit() async {
    // Implement create user logic
    final name = _nameController.text;
    final email = _emailController.text;
    final role = _roleController.text;

    // Call API or perform any necessary actions to create the user
    // You can use packages like http or dio for API calls

    _nameController.clear();
    _emailController.clear();
    _roleController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create User')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name')),
            TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email')),
            TextField(
                controller: _roleController,
                decoration: InputDecoration(labelText: 'Role')),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _onSubmit,
              child: Text('Create User'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CreateUserScreen(),
  ));
}
