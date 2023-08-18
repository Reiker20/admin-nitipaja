import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  PasswordTextField({Key? key, this.controller,this.text}) : super(key: key);
  var controller,text;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _new= false,_confirm= false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.text=='Kata Sandi Baru'?_new:_confirm,
        decoration: InputDecoration(
          suffixIcon: widget.text=='Kata Sandi Sekarang'?null:IconButton(onPressed: (){
            widget.text=='Kata Sandi Baru'?
            setState(() {
              _new = !_new;
            }):setState(() {
              _confirm = !_confirm;
            });
          }, icon: Icon(_new?Icons.remove_red_eye_outlined:_confirm?Icons.remove_red_eye_outlined:Icons.remove_red_eye)),
          labelText: widget.text,
        ),
      ),
    );
  }
}
