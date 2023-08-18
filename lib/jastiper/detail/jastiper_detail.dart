// import 'package:flutter/material.dart';
// import '/config/palette.dart';
// import '/jastiper/buttons/buttons_follow.dart';

// import '../../api/apifetch.dart';

// class JastiperDetail extends StatelessWidget {
//   var id;

//   JastiperDetail({Key? key, this.id}) : super(key: key);

//   APiFetch_Authentication api = APiFetch_Authentication();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Palette.activeColor,
//         elevation: 0,
//         actions: [Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20),
//             child: Icon(Icons.report_gmailerrorred,size: 30,))],
//       ),
//       backgroundColor: Palette.backgroundColor,
//       body: FutureBuilder(
//         future: api.getallUser(),
//         builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//           if(snapshot.hasData){
//             String index = snapshot.data!.map((e) => e['id']).toString();
//             index = index.replaceAll(RegExp('[(,)]'), '');
//             index = index.replaceAll(RegExp(' '), '');
//             final her =index.indexOf(id);
//             print(index);
//             print(her);
//             return Stack(
//               children: [
//                 Positioned(
//                   top: 0,
//                   right: 0,
//                   left: 0,
//                   child: Container(
//                     height: MediaQuery.of(context).size.height*20/100,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Palette.activeColor,
//                       ),
//                     ),
//                   ),),
//                 Positioned(
//                   top: MediaQuery.of(context).size.height*10/100,
//                   right: 0,
//                   left: 0,
//                   child: Container(
//                     margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*10/100,right: MediaQuery.of(context).size.width*10/100, ),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(20)),
//                         color: Colors.white
//                     ),
//                     height: MediaQuery.of(context).size.height*30/100,
//                     child: Padding(
//                       padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*8/100,bottom: MediaQuery.of(context).size.height*5/100, left: MediaQuery.of(context).size.width*10/100,right: MediaQuery.of(context).size.width*10/100),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(snapshot.data[her]['name'].toString(), style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),),
//                           SizedBox(height: 2,),
//                           Text('ID:${snapshot.data[her]['uuid'].toString()}', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.normal, fontSize: 15),),
//                           SizedBox(height: 3,),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(Icons.star, color: Colors.amber, size: 20,),
//                               SizedBox(width: 5,),
//                               Text('5.0', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15),),
//                               SizedBox(width: 5,),
//                               Text('-', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15),),
//                               SizedBox(width: 5,),
//                               Text('145', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15),),
//                               SizedBox(width: 5,),
//                               Text('Points', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15),),
//                             ],
//                           ),
//                           SizedBox(height: 10,),
//                           FollowButtons()
//                         ],
//                       ),
//                     ),
//                   ),),
//                 Positioned(
//                     top: MediaQuery.of(context).size.height*2/100,
//                     right: 0,
//                     left: 0,
//                     child:
//                     Container(
//                       height: 120,
//                       width: 120,
//                       child: CircleAvatar(
//                         backgroundColor: Colors.white,
//                         child: Container(
//                           height: 100,
//                           width: 100,
//                           child: CircleAvatar(
//                             backgroundColor: Palette.activeColor2,
//                           ),
//                         ),
//                       ),
//                     )
//                 ),
//                 Positioned(
//                     top: MediaQuery.of(context).size.height*42/100,
//                     right: 0,
//                     left: 0,
//                     child:Padding(
//                       padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*10/100 ),
//                       child: Row(
//                         children: [
//                           _tab(context),
//                           Padding(
//                             padding:EdgeInsets.only(left: 10),
//                             child: Column(
//                               children: [
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text('Teman', style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal, fontSize: 15),),
//                                     Container(
//                                       height: MediaQuery.of(context).size.height*13/100,
//                                       width: MediaQuery.of(context).size.width*65/100,
//                                       child: ListView.builder(
//                                         scrollDirection: Axis.horizontal,
//                                         itemCount: 4,
//                                         itemBuilder: (context, index) {
//                                           return _jastiperTile();
//                                         },),
//                                     )
//                                   ],
//                                 ),
//                                 SizedBox(height: 10,),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text('Pesanan Terbaru', style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal, fontSize: 15),),
//                                     SizedBox(height: 10,),
//                                     Container(
//                                       height: MediaQuery.of(context).size.height*30/100,
//                                       width: MediaQuery.of(context).size.width*65/100,
//                                       child: ListView.builder(
//                                         scrollDirection: Axis.vertical,
//                                         itemCount: 2,
//                                         itemBuilder: (context, index) {
//                                           return Container(
//                                             decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 borderRadius: BorderRadius.all(Radius.circular(10))
//                                             ),
//                                             margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*1/100),
//                                             child: Padding(
//                                               padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
//                                               child: Row(
//                                                 children: [
//                                                   Container(
//                                                     margin: EdgeInsets.all(10),
//                                                     decoration: BoxDecoration(
//                                                         color: Colors.black
//                                                     ),
//                                                     height: 50,
//                                                     width: 50,
//                                                   ),
//                                                   Expanded(child: Text('Nasi goreng, Es coklat, Nasi Ayam Geprek')),
//                                                   Align(
//                                                     alignment: Alignment.bottomRight,
//                                                     child: Column(
//                                                       children: [
//                                                         SizedBox(height: 40,),
//                                                         Text('2 Apr 2023', style: TextStyle(color: Colors.grey, fontSize: 10)),
//                                                       ],
//                                                     ),
//                                                   )
//                                                 ],
//                                               ),
//                                             ),
//                                           );
//                                         },),
//                                     )
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     )
//                 )
//               ],
//             );
//           }
//           return Center(child: CircularProgressIndicator(),);
//         },
//       ),
//     );
//   }

//   _jastiperTile(){
//     return InkWell(
//       onTap: (){
//         // Navigator.push(context, MaterialPageRoute(builder: (context) => JastiperDetail(),));
//       },
//       child: Container(
//           margin: EdgeInsets.only(top: 10),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(10))
//           ),
//           child:Column(
//             children: [
//               Container(
//                 margin: EdgeInsets.only(right: 5, ),
//                 child:Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50)), color: Colors.white, border: Border.all(color: Palette.activeColor)),height: 50,width: 50,),

//               ),
//               SizedBox(height: 5,),
//               Text('data', style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.normal),)
//             ],
//           )),
//     );
//   }

//   _tab(context){
//      return Container(
//        height: MediaQuery.of(context).size.height*40/100,
//        decoration: BoxDecoration(
//            borderRadius: BorderRadius.all(Radius.circular(20)),
//            color: Palette.activeColor
//        ),
//        child: Padding(
//          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*5/100,vertical: MediaQuery.of(context).size.width*10/100),
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceAround,
//            children: [
//              Column(
//                children: [
//                  Text('10k', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600, fontSize: 20),),
//                  SizedBox(height: 10,),
//                  Text('Suka', style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal, fontSize: 13),),
//                ],
//              ),
//              SizedBox(height: 20,),
//              Container(color: Colors.white,height: 1,width: MediaQuery.of(context).size.width*10/100,),
//              SizedBox(height: 20,),
//              Column(
//                children: [
//                  Text('10k', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600, fontSize: 20),),
//                  SizedBox(height: 10,),
//                  Text('Suka', style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal, fontSize: 13),),
//                ],
//              ),
//              SizedBox(height: 20,),
//              Container(color: Colors.white,height: 1,width: MediaQuery.of(context).size.width*10/100,),
//              SizedBox(height: 20,),
//              Column(
//                children: [
//                  Text('10k', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600, fontSize: 20),),
//                  SizedBox(height: 10,),
//                  Text('Suka', style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal, fontSize: 13),),
//                  SizedBox(height: 10,),
//                ],
//              ),
//            ],
//          ),
//        ),);
//   }
// }
