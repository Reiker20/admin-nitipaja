// import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:nitip/controller/item_controller.dart';
// import 'package:nitip/controller/login_getx.dart';
// import 'package:nitip/screens/cart_screen.dart';
// import 'package:nitip/textfield/password_textfield.dart';

// import '../../config/palette.dart';
// import '../../location/list_location.dart';


// class SheetDialogOrder extends StatefulWidget {

//   SheetDialogOrder({super.key,this.id});
//   var id;

//   @override
//   State<SheetDialogOrder> createState() => _SheetDialogOrderState();
// }

// class _SheetDialogOrderState extends State<SheetDialogOrder>{
//   String? selectedValue;
//   ControllerAuth c = Get.put(ControllerAuth());
//   ItemController c_item = Get.put(ItemController());
//   TextEditingController _destination = TextEditingController();
//   TextEditingController _contribute = TextEditingController();
//   final db =  FirebaseFirestore.instance.collection('User');

//   init() async {
//     DocumentSnapshot  snapshot = await db.doc(c.token.toString()).get();
//     Map<String,dynamic> user = snapshot.data() as Map<String,dynamic>;
//     // if(c_item.destination.value!=''||c_item.destination.value!=null||c_item.destination.value!='null'){
//     //   DocumentSnapshot  location_snapshot = await db.doc(c.token.toString()).collection('Location').doc(c_item.destination.value).get();
//     //   Map<String,dynamic> location = location_snapshot.data() as Map<String,dynamic>;
//     //   _destination.text = location['area'].toString();
//     // }else
//     if(user['location'].toString()!=null||user['location'].toString()!='null'||user['location'].toString()!=''){
//       DocumentSnapshot  location_snapshot = await db.doc(c.token.toString()).collection('Location').doc(user['location'].toString()).get();
//       Map<String,dynamic> location = location_snapshot.data() as Map<String,dynamic>;
//       c_item.destination.value = user['location'].toString();
//       _destination.text = location['area'].toString();
//     }
//       if(c_item.contribute.value!=''||c_item.contribute.value!=null||c_item.contribute.value!='null'){
//         DocumentSnapshot  location_snapshot = await db.doc(c.token.toString()).collection('Location').doc(c_item.contribute.toString()).get();
//         Map<String,dynamic> location = location_snapshot.data() as Map<String,dynamic>;
//         _contribute.text = location['area'].toString();
//       }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//         alignment: Alignment.center,
//         child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 30),
//             child: Material(
//                 color: Colors.white,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20)),
//                 child: Padding(
//                     padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//                     child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                Expanded(child: Text('Isi Data Berikut \nUntuk Menitipkan Kepada Jastiper',textAlign: TextAlign.center,style: TextStyle(color: Palette.TextColor2),)),
//                                 InkWell(
//                                     onTap: (){
//                                       Navigator.pop(context);
//                                     },
//                                     child: Icon(CupertinoIcons.xmark_seal_fill, color: Palette.activeColor,size: 30,)),
//                               ],
//                             ),
//                           SizedBox(height: 20,),
//                           _textField(text: 'Lokasi Pengambilan', controller: _contribute),
//                           _textField(text: 'Lokasi Pengantaran', controller: _destination),
//                           _Item(),
//                           _addButton()
//                          ]
//                     )
//                 )
//             )
//         )
//     );
//   }

//   _Item(){
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//       child: InkWell(
//         onTap: (){
//           Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(order: true),));
//         },
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(5)),
//             border: Border.all(color: Palette.TextColor2)
//           ),
//           height: MediaQuery.of(context).size.height*10/100,
//           width: MediaQuery.of(context).size.width,
//           child: Obx(
//             () => Padding(
//               padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
//               child:c_item.item.isEmpty?
//                   Center(child: Text('Tidak Ada Item'),)
//               : Wrap(
//                   alignment: WrapAlignment.start,
//                   spacing: 2.0,
//                   runSpacing: 1.0,
//                   children: [
//                     for (int i =0; i<c_item.item.length; i++)
//                       Chip(
//                         backgroundColor: Palette.activeColor,
//                         deleteIconColor: Palette.backgroundColor,
//                         label: Text(c_item.item[i].toString(), style: TextStyle(color: Palette.backgroundColor)),
//                         onDeleted: () {
//                           setState(() {
//                             c_item.item.remove(c_item.item[i]);
//                             c_item.item_id.remove(c_item.item_id[i]);
//                           });
//                         },
//                       ),
//                   ],
//                 ),
//               ),
//           ),
//           ),
//         ),
//     );
//   }

//   _textField({text,controller}){
//     return  Padding(
//       padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//       child: InkWell(
//         onTap: () async {
//           if(controller==_destination) {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => Location_Page(id: c_item.destination.toString()),
//                 ));
//           }else{
//             DocumentSnapshot snapshot = await db.doc(c.token.toString()).get();
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                 builder: (context) => Location_Page(section: 1, id:  c_item.contribute.toString()),
//                 ));
//           }
//         },
//         child: TextField(
//           controller: controller,
//           decoration: InputDecoration(
//             enabled: false,
//             border: OutlineInputBorder(),
//             label: Text(text, style: TextStyle(
//                 fontWeight: FontWeight.normal,
//                 fontSize: 15,
//                 color: Palette.TextColor2
//             ),),
//           ),
//           style: TextStyle(
//               fontWeight: FontWeight.normal,
//               fontSize: 15,
//               color: Palette.TextColor2
//           ),
//         ),
//       ),
//     );
//   }
  
//   _addButton(){
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//       child: InkWell(
//         onTap: () async {
//           QuerySnapshot  snapshot = await db.doc(c.token.toString()).collection('Cart').get();
//           QuerySnapshot  docsnapshotlocation = await db.doc(c.token.toString()).collection('Location').get();
//           List<Map<String,dynamic>> data = snapshot.docs.map((DocumentSnapshot document) {
//             return document.data()! as Map<String, dynamic>;}).toList();
//           List<Map<String,dynamic>> datalocation = docsnapshotlocation.docs.map((DocumentSnapshot document) {
//             return document.data()! as Map<String, dynamic>;}).toList();
//           var id = DateTime.now().toString()+Random().nextInt(1000).toString();
//           List items=[];
//           if(_contribute.text.isEmpty||_contribute.text==''){
//             toast(text: 'Masukkan Lokasi Pengambilan ');
//           }else
//           if(_destination.text.isEmpty){
//             toast(text: 'Masukkan Lokasi Pengantaran');
//           }else
//           if(c_item.item_id.isEmpty){
//             toast(text: 'Masukkan Item');
//           }else{
//             Map<String,dynamic> price = {'price':'0','price_all':'0'};
//             c_item.item_id.forEach((element) {
//               int index = data.indexWhere((e) => e['id'].toString()==element.toString());
//               data[index].addAll(price);
//               items.add(data[index]);
//             });
//             int index = datalocation.indexWhere((element) => element['id'].toString()==c_item.contribute.toString());
//             Map<String,dynamic> contribute = datalocation[index];
//             index = datalocation.indexWhere((element) => element['id'].toString()==c_item.destination.toString());
//             Map<String,dynamic> detination = datalocation[index];
//             Map<String,dynamic> order = {'contribute': contribute, 'destination':detination, 'items':items, 'token': c.token.toString(), 'id':id, 'status':false, 'total':'0'};
//             print(order);
//             db.doc(widget.id.toString()).collection('Order').doc(id).set(order);
//             Navigator.pop(context);
//           }
//         },
//         child: Container(
//           decoration: BoxDecoration(color: Palette.activeColor, borderRadius: BorderRadius.all(Radius.circular(5))),
//           child: Padding(
//             padding: EdgeInsets.symmetric(vertical: 10),
//             child: Center(child: Text('Pesan Jastiper', style: TextStyle(
//                 fontWeight: FontWeight.normal,
//                 fontSize: 15,
//                 color: Palette.backgroundColor
//             ),)),
//           ),
//         ),
//       ),
//     );
//   }

//   toast({text}){
//     return Fluttertoast.showToast(
//         backgroundColor: Palette.activeColor,
//         msg: text,
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         timeInSecForIosWeb: 1,
//         textColor: Colors.white,
//         fontSize: 16.0
//     );
//   }
// }




