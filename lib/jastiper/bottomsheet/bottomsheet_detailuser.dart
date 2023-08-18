// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import '../../chat/chat_detail/chatDetail.dart';
// import '/jastiper/buttons/buttons_follow.dart';

// import '../../config/palette.dart';

// class BottomSheet_DetailUser extends StatefulWidget {
//   BottomSheet_DetailUser({super.key,
//     this.name, this.username,this.id,this.uuid, this.image
//   });
//   var name, username, uuid,id,image;
//   @override
//   State<BottomSheet_DetailUser> createState() => _BottomSheet_DetailUserState();
// }

// class _BottomSheet_DetailUserState extends State<BottomSheet_DetailUser> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Stack(
//         children: [
//           Container(
//             color: Palette.activeColor,
//             height: MediaQuery.of(context).size.height*20/100,
//             width: MediaQuery.of(context).size.width,
//             child: Padding(
//               padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*5/100, horizontal: 20),
//               child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                                 borderRadius: BorderRadius.all(Radius.circular(50))
//                             ),
//                             height: 65,
//                             width: 65,
//                             child: Padding(
//                               padding: EdgeInsets.all(10),
//                               child: Image.network(widget.image,fit: BoxFit.fill),
//                             ),
//                           ),
//                           SizedBox(width: 10,),
//                           Expanded(
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(widget.name.toString(), style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.w500),),
//                                       Text('@${widget.username}', style: TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.normal),),
//                                       InkWell(
//                                         onTap: (){
//                                           Clipboard.setData(ClipboardData(text: '#${widget.uuid}'));
//                                           toast(text: 'ID sudah disalin');
//                                         },
//                                         child: Row(
//                                           children: [
//                                             Text('#${widget.uuid}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 15)),
//                                             SizedBox(width: 5,),
//                                             Icon(Icons.copy_all_rounded, size: 14, color: Colors.white,)
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               )),
//                           Row(
//                             children: [
//                               InkWell(
//                                 onTap: (){
//                                   print(widget.id.toString());
//                                   Navigator.push(context, MaterialPageRoute(builder: (context) => ChatDetailPage(name: widget.name, id: widget.id),));
//                                 },
//                                 child: Padding(
//                                     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                                     child: Icon(CupertinoIcons.chat_bubble_2_fill, size: 40,color: Palette.backgroundColor,)
//                                 ),
//                               ),
//                               InkWell(
//                                 onTap: (){
//                                   // Navigator.push(context, MaterialPageRoute(builder: (context) => ChatDetailPage(),));
//                                 },
//                                 child: Padding(
//                                     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                                     child: Icon(CupertinoIcons.exclamationmark_circle_fill, size: 35,color: Palette.backgroundColor,)
//                                 ),
//                               ),
//                             ],
//                           )
//                           // Column(
//                           //   children: [
//                           //     Row(
//                           //       children: [
//                           //         Padding(
//                           //           padding: EdgeInsets.only(right: 5),
//                           //           child: Icon(CupertinoIcons.flame_fill,
//                           //               color: Palette.backgroundColor,
//                           //               size: 20),
//                           //         ),
//                           //
//                           //         Text(
//                           //           '50',
//                           //           style: TextStyle(
//                           //             color: Palette.backgroundColor,
//                           //             fontFamily: 'Roboto',
//                           //             fontSize: 15,
//                           //             letterSpacing: 0,
//                           //             fontWeight: FontWeight.normal,
//                           //             height: 1,
//                           //           ),
//                           //         ),
//                           //       ],
//                           //     ),
//                           //     SizedBox(height: 5,),
//                           //     Row(
//                           //       children: [
//                           //         Padding(
//                           //           padding: EdgeInsets.only(right: 5),
//                           //           child: Icon(CupertinoIcons.rectangle_stack_person_crop_fill,
//                           //               color: Palette.backgroundColor,
//                           //               size: 20),
//                           //         ),
//                           //         Text(
//                           //           '50',
//                           //           style: TextStyle(
//                           //             color: Palette.backgroundColor,
//                           //             fontFamily: 'Roboto',
//                           //             fontSize: 15,
//                           //             letterSpacing: 0,
//                           //             fontWeight: FontWeight.normal,
//                           //             height: 1,
//                           //           ),
//                           //         ),
//                           //       ],
//                           //     ),
//                           //   ],
//                           // ),
//                         ],
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       ),
//                       // SizedBox(height: 10,),
//                       // FollowButtons(name: widget.username.toString(),id: widget.id.toString(),)
//                     ],
//                   ),
//             ),
//           ),
//         ],
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
