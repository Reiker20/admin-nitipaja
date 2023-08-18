// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
// import '/config/palette.dart';

// import '../api/apifetch.dart';
// import '../api/apifriends.dart';

// class Notify_Tile extends StatelessWidget {
//   var type,status,id;
//   Notify_Tile({Key? key,this.type,this.status,this.id}) : super(key: key);

//   APiFetch_Authentication api = APiFetch_Authentication();
//   ApiFetchFriends apifriends = ApiFetchFriends();
//   var db =  FirebaseFirestore.instance.collection('User');

//   @override
//   Widget build(BuildContext context) {
//     return type=='req-friend'?StreamBuilder(
//       stream: db.snapshots(),
//       builder: (context, snapshot) {
//         if(snapshot.hasData){
//           List<Map<String,dynamic>> data = snapshot.data!.docs.map((DocumentSnapshot document) {
//             return document.data()! as Map<String, dynamic>;}).toList();
//           int index = data.indexWhere((element) => element['token']==id.toString());
//           return Container(
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(10)),
//                 border: Border.all(color: Palette.activeColor)
//             ),
//             margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//               child: Row(
//                 children: [
//                   Container(
//                     width: 50,
//                     height: 50,
//                     child: CircleAvatar(
//                       backgroundImage: NetworkImage(
//                           data[index]['gender'].toString()=='P'?'https://shopper.nitipaja.online/storage/images/Girl.png':'https://shopper.nitipaja.online/storage/images/Boy.png',
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 10,),
//                   Expanded(child: Text(data[index]['username'])),
//                   SizedBox(width: 10,),
//                 ],
//               ),
//             ),
//           );
//         }
//         return Shimmer.fromColors(
//             baseColor: Colors.white30!,
//             highlightColor: Colors.grey[300]!,
//               child: const SizedBox(height: 50),
//         );
//       }
//     ):Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(10)),
//           border: Border.all(color: Palette.activeColor)
//       ),
//       margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//         child: Row(
//           children: [
//             Container(
//               height: 50, width: 50,
//               color: Palette.activeColor,
//             ),
//             SizedBox(width: 10,),
//             Expanded(child: Text('mulai berteman')),
//             SizedBox(width: 10,),
//           ],
//         ),
//       ),
//     );
//   }
// }
