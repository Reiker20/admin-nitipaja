// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '/chat/chat_detail/chatDetail.dart';
// import '/config/palette.dart';

// class FollowButtons extends StatefulWidget {
//   var id, name;

//   FollowButtons({Key? key,this.id,this.name}) : super(key: key);

//   @override
//   State<FollowButtons> createState() => _FollowButtonsState();
// }

// class _FollowButtonsState extends State<FollowButtons> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Expanded(
//           child:
//               Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(50)),
//                     color: Palette.backgroundColor
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(vertical: 10, horizontal: MediaQuery.of(context).size.width*10/100),
//                   child: Text(
//                     'Ikuti',
//                     style: TextStyle(color: Palette.activeColor, fontSize: 20, fontWeight: FontWeight.w500),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//           ),
//         ),
//         InkWell(
//           onTap: (){
//             print(widget.id.toString());
//             Navigator.push(context, MaterialPageRoute(builder: (context) => ChatDetailPage(name: widget.name, id: widget.id),));
//           },
//           child: Padding(
//                 padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                 child: Icon(CupertinoIcons.chat_bubble_2_fill, size: 40,color: Palette.backgroundColor,)
//             ),
//         ),
//         InkWell(
//           onTap: (){
//             Navigator.push(context, MaterialPageRoute(builder: (context) => ChatDetailPage(),));
//           },
//           child: Padding(
//                 padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                 child: Icon(CupertinoIcons.exclamationmark_circle_fill, size: 35,color: Palette.backgroundColor,)
//             ),
//           ),
//       ],
//     );
//   }
// }
