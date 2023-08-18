// import 'dart:core';
// import 'dart:ffi';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../api/apidriverfetch.dart';
// import '../../config/palette.dart';
// import '../../controller/login_getx.dart';
// import '../bottomsheet/sheetdialog_jastiper.dart';

// class JastiperButtons extends StatefulWidget {

//   JastiperButtons({Key? key, }) : super(key: key);

//   @override
//   State<JastiperButtons> createState() => _JastiperButtonsState();
// }

// class _JastiperButtonsState extends State<JastiperButtons> {
//   bool jastiper = false;
//   APiFetch_Driver api = APiFetch_Driver();

//   final db =  FirebaseFirestore.instance.collection('User');
//   ControllerAuth c = Get.put(ControllerAuth());

//   @override
//   void initState() {
//     // TODO: implement initState
//     init();
//     super.initState();
//   }

//   init() async {
//     QuerySnapshot stream = await db.get();
//     List data = stream.docs.map((DocumentSnapshot document) {
//       return document.data()! as Map<String, dynamic>;}).toList();

//     data.forEach((element) {
//       if(element['token']==c.token.toString()) {
//         int i = data.indexWhere((e) => element['token'] == e['token']);
//           jastiper = data[i]['status'].toString()=='true'?true:false;
//         print(data[i]['status']);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<DocumentSnapshot>(
//       stream: db.doc(c.token.toString()).snapshots(),
//       builder: (context, snapshot) {
//         if(snapshot.hasData){
//           bool jastiper = snapshot.data!['status'] as bool;
//           return InkWell(
//             onTap: () {
//               showDialog(context: context, builder: (context) {
//                 return SheetDialogJastiper(driver: jastiper,);
//               },);
//               // db.doc(c.token.toString()).update({'status':jastiper?false:true});
//               // setState(() {
//               //       jastiper= jastiper? true:false;
//               // });
//               // print(jastiper);
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(15)),
//                   color: jastiper?Palette.activeColor:Colors.white,
//                   border: Border.all(color: Palette.activeColor)
//               ),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
//                 child: Text('Jastiper', style: TextStyle(color: jastiper?Palette.backgroundColor:Palette.activeColor, fontSize: 15, fontWeight: FontWeight.normal),),
//               ),),
//           );
//         }
//         return SizedBox(height: 3,);
//       }
//     );
//   }

// }
