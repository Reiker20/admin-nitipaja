// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shimmer/shimmer.dart';
// import '../modal/user_modal.dart';
// import '/api/apifetch.dart';
// import '/config/palette.dart';
// import '/controller/buidnavbar.dart';
// import '/jastiper/detail/jastiper_detail.dart';
// import '/textfield/search_textfield.dart';
// import '/tile/jastiper_tile.dart';

// import '../api/apidriverfetch.dart';
// import 'bottomsheet/bottomsheet_detailuser.dart';
// import 'bottomsheet/bottomsheet_driver.dart';

// class JastiperPage extends StatefulWidget {
//   JastiperPage({super.key});
//   @override
//   State<JastiperPage> createState() => _JastiperPageState();
// }

// class _JastiperPageState extends State<JastiperPage> {
//   APiFetch_Driver apidriver = APiFetch_Driver();
//   APiFetch_Authentication api = APiFetch_Authentication();
//   BuildNavBarController c = BuildNavBarController();
//   List listData = <User>[];
//   final db =  FirebaseFirestore.instance.collection('User');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Palette.backgroundColor,
//       appBar: AppBar(
//         leading: InkWell(
//             onTap: (){
//               Navigator.pop(context,true);
//             },
//             child: Icon(Icons.keyboard_backspace_sharp, color: Colors.black54, size: 25)),
//         iconTheme: IconThemeData(
//             color: Colors.black54
//         ),
//         title: Container(
//           margin: EdgeInsets.only(left: 20, right: 20),
//           width: MediaQuery.of(context).size.width- 40,
//           child:Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Pilih Jastiper',
//                     style: TextStyle(
//                       color: Colors.black54,
//                       fontSize: 20,
//                       fontWeight: FontWeight.normal,
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       InkWell(
//                         onTap: (){
//                           c.searchJastiper==0?
//                           c.searchJastiper.value=1:
//                           c.searchJastiper.value=0;
//                         },
//                         child: Obx(
//                               ()=> Icon(
//                               Icons.search,
//                               color: c.searchJastiper==0?Colors.black54:Palette.activeColor,
//                               size: 25),
//                         )
//                       ),
//                       // Padding(
//                       //   padding: EdgeInsets.symmetric(horizontal: 0),
//                       //   child: Icon(
//                       //       Icons.filter_list_alt,
//                       //       color: Colors.black54,
//                       //       size: 25),
//                       // ),
//                     ],
//                   ),
//                 ],
//               ),
//         ),
//         elevation: 0,
//         backgroundColor: Palette.backgroundColor,
//       ),
//       body: SafeArea(
//         child: Container(
//           child: Column(
//             children: [
//               Obx(() => c.searchJastiper!=0?SearchTextField():SizedBox()),
//               Expanded(
//                 child: StreamBuilder(
//                     stream: db.snapshots(),
//                     builder: (context, snapshot) {
//                       if(snapshot.hasData){
//                         List driver =[];
//                         List<Map<String,dynamic>> data = snapshot.data!.docs.map((DocumentSnapshot document) {
//                             return document.data()! as Map<String, dynamic>;}).where((element) => element['status'].toString().contains('true')).where((element) => element['driver'].toString().contains('false')||element['driver']==null).toList();
//                           // for (int i = 0; i <data.length; i++) {
//                         //   if (data[i]['status'].toString().contains('true')) {
//                         //     driver.add(data[i]['token']);
//                         //   }
//                         // }
//                         // Set<int> driverOn = Set<int>();
//                         // for(int i = 0; i<driver.length;i++){
//                         //   int driver_id = data.indexWhere((element) => element['token'].toString().contains(driver[i]));
//                         //   int driver_on = data.indexWhere((element) => element['driver'].toString().contains('true'));
//                         //   listData.add(User(
//                         //     position: data[driver_id]['location'],
//                         //       username: data[driver_id]['username'].toString(),image: data[driver_id]['gender'].toString()=='P'?'https://firebasestorage.googleapis.com/v0/b/shopper-89651.appspot.com/o/Girl.png?alt=media&token=a632d21b-e9a3-43a7-a80b-5036421f0392':'https://firebasestorage.googleapis.com/v0/b/shopper-89651.appspot.com/o/Boy.png?alt=media&token=a4708dae-faac-47c1-b48e-982da586337d', name: data[driver_id]['name'].toString(), uuid: data[driver_id]['uuid'].toString(), id: data[driver_id]['token'].toString(), email: data[driver_id]['email'].toString(), gender: data[driver_id]['gender'].toString()));
//                         //   if(driverOn.isNotEmpty)driverOn.add(driver_on);
//                         // }
//                         // if(driverOn!=null) {
//                         //   driverOn.forEach((element) {
//                         //     listData.removeAt(element);
//                         //   });
//                         // }
//                         if(data.isEmpty)
//                           return Center(
//                             child: Padding(
//                               padding: EdgeInsets.symmetric( horizontal:MediaQuery.of(context).size.width*20/100),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     decoration: BoxDecoration(
//                                       image: DecorationImage(
//                                         image: AssetImage('assets/images/shopper.png')
//                                       )
//                                     ),
//                                     height: 100,
//                                     width: 100,
//                                   ),
//                                   Text('Tunggu Sebentar', style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 20),textAlign: TextAlign.center),
//                                   SizedBox(height: 10,),
//                                   Text('Saat belum ada jastiper yang aktif, mohon di tunggu beberapa saat lagi.', style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 15), textAlign: TextAlign.center,)
//                                 ],
//                               ),
//                             ),
//                           );

//                         return ListView.builder(
//                           itemCount: data.length,
//                           itemBuilder: (context, index) {
//                             var listJastiper = data[index];
//                             return JastiperList_Tile(
//                               image: listJastiper['image'],
//                               username: listJastiper['username'],
//                               token: listJastiper['token'],
//                               name: listJastiper['name'],
//                               uuid: listJastiper['uuid'],
//                               point: listJastiper['location']==null?'null':listJastiper['location'],
//                             );
//                           },
//                         );
//                       }
//                       return Shimmer.fromColors(
//                         baseColor: Colors.white30!,
//                         highlightColor: Colors.grey[300]!,
//                         child: ListView.builder(
//                           itemCount: 10,
//                           itemBuilder: (context, index) {
//                             return Card(
//                               elevation: 1.0,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(16),
//                               ),
//                               child: const SizedBox(height: 80),
//                             );
//                           },
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//             ],
//           )
//           ),
//         ),
//     );
//   }

//   Future<List<dynamic>> data() async {
//     QuerySnapshot stream = await db.get();
//     List data = stream.docs.map((DocumentSnapshot document) {
//       return document.data()! as Map<String, dynamic>;}).toList();
//     return data;
//   }


// }



