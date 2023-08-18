import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/textfield/profile_textfield.dart';
import 'api/apifetch.dart';
import 'controller/login_getx.dart';
import 'jastiper/bottomsheet/bottomsheet_driver.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tag Input Field'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TagInputField(),
      ),);

  }
  }

class TagInputField extends StatefulWidget {
  @override
  _TagInputFieldState createState() => _TagInputFieldState();
}

class _TagInputFieldState extends State<TagInputField> {
  TextEditingController _tagController = TextEditingController();
  List<String> _tags = [];

  void _addTag(String tag) {
    setState(() {
      _tags.add(tag.trim());
      _tagController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: [
            for (String tag in _tags)
              Chip(
                label: Text(tag),
                onDeleted: () {
                  setState(() {
                    _tags.remove(tag);
                  });
                },
              ),
          ],
        ),
        // TextField(
        //   controller: _tagController,
        //   decoration: InputDecoration(
        //     hintText: 'Enter tags separated by commas',
        //     suffixIcon: IconButton(
        //       icon: Icon(Icons.add),
        //       onPressed: () {
        //         if (_tagController.text.trim().isNotEmpty) {
        //           _addTag(_tagController.text);
        //         }
        //       },
        //     ),
        //   ),
        //   onSubmitted: (String value) {
        //     if (value.trim().isNotEmpty) {
        //       _addTag(value);
        //     }
        //   },
        // ),
      ],
    );
  }
}
