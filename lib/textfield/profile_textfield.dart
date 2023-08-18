// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import '/settings/profile/changepassword.dart';

// import '../api/apifetch.dart';
// import '../config/palette.dart';
// import '../controller/login_getx.dart';

// class ProfileTextField extends StatelessWidget {
//    ProfileTextField({Key? key,this.controller,this.text,this.value, this.id}) : super(key: key);
//    var controller,text,value,id;
//    ControllerAuth c = Get.put(ControllerAuth());

//    APiFetch_Authentication api = APiFetch_Authentication();

//    @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: (){
//         if(text=='Kata Sandi'){
//           showDialog(
//             context: context, builder: (context) => ShowCustomDialog(),);
//           c.password_result = false;
//         }
//       },
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//         child: TextField(
//           onTap: (){

//           },
//           controller: controller,
//           obscureText: text=='Kata Sandi'? true :false,
//           style: TextStyle(fontSize: 18, color: Palette.TextColor2),
//           decoration: InputDecoration(
//             suffixIcon: text=='Tanggal Lahir'?
//                 IconButton(onPressed: (){
//                   onTapFunction(context: context, controller: controller);
//                 }, icon: Icon(CupertinoIcons.calendar))
//                 :text=='Email'?
//                 IconButton(onPressed: (){
//                   print(value);
//                   Map<String,dynamic> body = {'user_id': id};
//                   api.sendVerification(body);
//                 }, icon: Icon(value==null||value=='null'||value==''?Icons.warning:null, size: 20, color: Colors.yellow.shade800,)):null,
//             enabled: text=='Kata Sandi'? false:true,
//             // border: OutlineInputBorder(),
//             labelText: text,
//           ),
//         ),
//       ),
//     );
//   }

//    onTapFunction({required BuildContext context, controller}) async {
//      int firstdate = DateTime.now().year.toInt()-85;
//      int lastdate = DateTime.now().year.toInt()-10;
//      DateTime commondate = DateTime.parse(value);
//      DateTime? pickedDate = await showDatePicker(
//        context: context,
//        lastDate: DateTime(lastdate),
//        firstDate: DateTime(firstdate),
//        initialDate: commondate,
//      );
//      if (pickedDate == null) return;
//      controller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
//    }


// }
