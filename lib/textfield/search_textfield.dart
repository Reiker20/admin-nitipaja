import 'package:flutter/material.dart';

import '../config/palette.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(80))
            ),
            hintText: 'Cari...',
            prefixIcon: Icon(Icons.search_rounded, size: 20, color: Colors.black54,)
        ),
      ),
    );
  }
}
