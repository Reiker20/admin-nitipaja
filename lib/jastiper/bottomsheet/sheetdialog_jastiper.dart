// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import '../../controller/login_getx.dart';
// import '/config/palette.dart';

// import '../../api/apidriverfetch.dart';
// import '../../homepage/jastiper/frontpage.dart';
// import '../../navbar/navbar_main.dart';

// class SheetDialogJastiper extends StatefulWidget {
//   var driver;

//   SheetDialogJastiper({super.key, this.driver});

//   @override
//   State<SheetDialogJastiper> createState() => _SheetDialogJastiperState();
// }

// class _SheetDialogJastiperState extends State<SheetDialogJastiper> {
//   APiFetch_Driver api = APiFetch_Driver();

//   bool check = false;

//   final db =  FirebaseFirestore.instance.collection('User');
//   ControllerAuth c = Get.put(ControllerAuth());


//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.center,
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 30),
//         child: Material(
//           color: Colors.white,
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(50)),
//           child: Padding(
//             padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Image.network('https://firebasestorage.googleapis.com/v0/b/shopper-89651.appspot.com/o/shopper.png?alt=media&token=904b0686-8db5-4f59-b655-7eb2349f4280', height: 80, width: 80,),
//                 SizedBox(height: 10,),
//                 Text(
//                   textAlign: TextAlign.center,
//                   widget.driver?'Mode Pelanggan':'Mode Jastiper',
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Palette.TextColor,
//                     fontWeight: FontWeight.w500
//                   ),
//                 ),
//                 SizedBox(height: 10,),
//                 Text(
//                   textAlign: TextAlign.center,
//                   'Apakah Anda Masuk Ke Mode Ini?',
//                   style: TextStyle(
//                     fontSize: 15,
//                     color: Palette.TextColor,
//                     fontWeight: FontWeight.normal
//                   ),
//                 ),
//                 SizedBox(height: 10,),
//                 Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Palette.TextColor2)
//                   ),
//                   height: 300,
//                   child: SingleChildScrollView(
//                     child: Padding(
//                       padding:  EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           Text(
//                             widget.driver?'Mode Pelanggan:\n1.Mode "pelanggan" mengacu pada situasi di mana Anda, sebagai konsumen atau pembeli, mengalami pengalaman membeli produk atau menggunakan layanan dari seorang pemberi layanan atau penjual.\n2.Dalam mode ini, Anda menilai kualitas pelayanan yang diberikan, mempertimbangkan kualitas produk atau layanan, dan mengambil keputusan apakah akan menjadi pelanggan setia atau mencari alternatif lain.\nJika Anda berada dalam mode customer dan tidak mendapatkan pelanggan dalam jangka waktu tertentu, mungkin Anda perlu melakukan evaluasi untuk meningkatkan strategi pemasaran, meningkatkan kualitas produk atau layanan, atau mencari cara-cara baru untuk menarik pelanggan potensial. Ketika melakukan perubahan untuk meningkatkan proses pelayanan dan pemasaran, Anda dapat kembali ke mode jastiper dan berusaha lagi untuk menarik dan mempertahankan pelanggan.':'Berikut adalah beberapa poin yang perlu dipertimbangkan:\n1.Pelayanan Utama: Anda harus siap memberikan pelayanan pelanggan yang ramah dan profesional, dengan kesediaan untuk membantu dan memenuhi kebutuhan mereka sebisa mungkin.\n2.Responsif: Anda harus siap merespons pertanyaan, permintaan, atau masalah yang diajukan oleh pelanggan dengan cepat dan efisien. Jangan biarkan pelanggan menunggu terlalu lama untuk mendapatkan tanggapan atau bantuan.\n3.Kesabaran: Bekerja di mode jastiper mungkin akan menghadirkan pelanggan yang membutuhkan waktu dan perhatian ekstra. Oleh karena itu, Anda harus memiliki kesabaran yang tinggi dan tidak cepat kehilangan kesabaran atau frustrasi saat berhadapan dengan pelanggan yang mungkin sulit atau membingungkan.\n4.Fleksibilitas: Anda perlu siap untuk menyesuaikan diri dengan kebutuhan dan preferensi individu pelanggan. Mungkin ada situasi di mana Anda perlu melibatkan diri lebih dalam atau melakukan tugas yang di luar tanggung jawab Anda, seperti mengurus keluhan atau menangani situasi yang tidak terduga.\n5.Penyelesaian Masalah: Kemampuan untuk mengatasi masalah dengan cepat dan efektif sangat penting dalam mode jastiper. Anda harus mampu berpikir kritis, menemukan solusi yang memadai, dan menindaklanjuti dengan tindakan yang tepat untuk memuaskan pelanggan.\n6.Komunikasi yang Efektif: Mengkomunikasikan informasi dengan jelas dan dengan gaya yang ramah akan membantu meningkatkan hubungan dengan pelanggan. Pastikan Anda dapat menggambarkan informasi dengan jelas, mendengarkan dengan baik, dan menjawab pertanyaan pelanggan dengan lengkap.\n7.Profesionalisme: Meskipun Anda mungkin direpotkan oleh pelanggan, penting untuk tetap menjaga sikap profesional. Jangan membiarkan emosi negatif mempengaruhi interaksi dengan pelanggan. Tetaplah sopan, ramah, dan berusaha memberikan layanan yang terbaik.',
//                             maxLines: 300,
//                             style: TextStyle(color: Palette.TextColor2, fontSize: 12),
//                             textAlign: TextAlign.left,
//                             overflow: TextOverflow.visible,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: 10),
//                   child: GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         check?check=false:check=true;
//                       });
//                     },
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 14,
//                           height: 14,
//                           margin: EdgeInsets.only(right: 8),
//                           decoration: BoxDecoration(
//                               color: check
//                                   ? Palette.textColor1
//                                   : Colors.transparent,
//                               border: Border.all(
//                                   width: 1,
//                                   color: check
//                                       ? Colors.transparent
//                                       : Palette.TextColor2),
//                               borderRadius: BorderRadius.circular(15)),
//                           child: Icon(
//                             size: 8,
//                             Icons.check_rounded,
//                             color: Colors.white,
//                           ),
//                         ),
//                         Text(
//                             "Setuju Dan Sudah Baca",
//                             style: TextStyle(color: Palette.TextColor, fontSize: 11,)
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 InkWell(
//                   onTap: (){
//                     if(check) {
//                       db.doc(c.token.toString()).update({'status':widget.driver.toString().contains('true')?false:true});
//                       widget.driver.toString().contains('true')?
//                           db.doc(c.token.toString()).collection('Order').get().then((value) {
//                             for (DocumentSnapshot ds in value.docs) {
//                               ds.reference.delete();
//                             }
//                             }):null;
//                       Navigator.pop(context);
//                       if(widget.driver) {
//                         Navigator.pop(context);
//                         Navigator.pushReplacement(context, MaterialPageRoute(
//                             builder: (context) => BottomNavBar()));
//                       }else {
//                         Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => Jastiper_View_page()));
//                       }
//                     }else {
//                       toast(text: 'Setujui Poin Dahulu');
//                     }
//                   },
//                   child: Container(
//                     margin: EdgeInsets.symmetric(vertical: 10),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(15)),
//                         color: check?Palette.activeColor:Colors.white,
//                         border: Border.all(color: Palette.activeColor)
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
//                       child: Text('Lanjutkan', style: TextStyle(color: check?Colors.white:Palette.activeColor, fontSize: 15, fontWeight: FontWeight.normal),),
//                     ),),
//                 )
//               ],
//             ),
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
