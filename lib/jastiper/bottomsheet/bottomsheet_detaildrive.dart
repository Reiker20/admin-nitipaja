import 'package:flutter/material.dart';
import '/config/palette.dart';

class BottomSheetDriverDetail extends StatelessWidget {
  const BottomSheetDriverDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.activeColor,
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(20), child: Column(
            children: [
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Monday', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                      Text('Feb 20, 2023', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.normal),)
                    ],
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white
                      ),
                      child: Icon(Icons.close, color: Palette.activeColor, size: 30),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width*5/100),
                  child: Row(
                    children: [
                      Container( height: 50, width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Palette.backgroundColor
                        ), ),
                      SizedBox( width: MediaQuery.of(context).size.width*5/100),
                      Expanded(child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(child: Text('Hero Yamada', style: TextStyle(fontSize: 20,color: Colors.black, fontWeight: FontWeight.bold,)), alignment: Alignment.bottomCenter),
                          Align(child: Container(
                            decoration: BoxDecoration(
                                color: Palette.backgroundColor,
                                borderRadius: BorderRadius.all(Radius.circular(50))
                            ),
                            child: Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.2/100,bottom: MediaQuery.of(context).size.height*0.2/100,right: MediaQuery.of(context).size.width*3/100,left: MediaQuery.of(context).size.width*3/100,),child: Text('Online')), ),alignment: Alignment.topRight,)
                        ],
                      ), ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20),),
                    color: Palette.activeColor3
                ),
                child: Padding(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width*5/100),
                  child: Row(
                    children: [
                      Container( height: 50, width: 50,
                        decoration: BoxDecoration(
                          color: Palette.activeColor,
                          borderRadius: BorderRadius.all(Radius.circular(50))
                        ),),
                      SizedBox( width: MediaQuery.of(context).size.width*5/100),
                      Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Palette.backgroundColor),
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height *
                                  1.2 /
                                  100,
                              bottom:
                                  MediaQuery.of(context).size.height * 1 / 100,
                              left:
                                  MediaQuery.of(context).size.width * 3.5 / 100,
                              right:
                                  MediaQuery.of(context).size.width * 3.5 / 100,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Chat your driver',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                                Icon(
                                  Icons.navigate_next,
                                  size: 20,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                        ))
                      ],
                  ),
                ),
              ),
            ],
          ),),
          Expanded(child: Container(
            color: Palette.backgroundColor,
            child: Column(
              children: [
                Container(child: Padding(
                    padding: EdgeInsets.only(left: 30, top: 10, bottom: 10),
                    child: Text('Pesanan', style: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.bold),)), width: MediaQuery.of(context).size.width,),
                Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*5/100, right: MediaQuery.of(context).size.width*5/100),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*5/100),
                      child: Column(
                        children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Jastip',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),),
                                      Container(child: Padding(child: Text('ANTAR', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 12,)),
                                        padding: EdgeInsets.only(top: 5,bottom: 5,left: 15,right: 15,),
                                      ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                          color: Palette.backgroundColor,
                                        ),)
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Text('Today',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),),
                                      Text(', 20 feb 2023',style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: Colors.black),),
                                    ],
                                  ),
                                ],
                              ),
                          SizedBox(height: 15,),
                          Container(height: 1, width: MediaQuery.of(context).size.width, color: Colors.black54,),
                          SizedBox(height: 15,),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(height: 50,width: 50, decoration: BoxDecoration(
                                    color: Palette.backgroundColor,
                                    borderRadius: BorderRadius.all(Radius.circular(50))
                                  ),),
                                  SizedBox(width: 20,),
                                  Expanded(child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Rusmart', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                                      Text('Smk Raden Umar Said', style: TextStyle(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.normal),)
                                    ],
                                  )),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 25,),
                                  Column(
                                    children: [
                                      Container(color: Colors.grey, height: 3, width: 1,),
                                      SizedBox(height: 2,),
                                      Container(color: Colors.grey, height: 3, width: 1,),
                                      SizedBox(height: 2,),
                                      Container( height: 3, width: 3,decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50)), color: Colors.grey,)),
                                      SizedBox(height: 2,),
                                      Container(color: Colors.grey, height: 3, width: 1,),
                                      SizedBox(height: 2,),
                                      Container(color: Colors.grey, height: 3, width: 1,),
                                    ],
                                  ),
                                  SizedBox(width: 40,),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Palette.activeColor3,
                                      borderRadius: BorderRadius.all(Radius.circular(50))
                                    ),
                                    child: Padding(padding: EdgeInsets.only(top: 2, right: 10, bottom: 2, left: 10),
                                    child: Text('500 m - 5 menit estimasi', style: TextStyle(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.bold),), ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(height: 50,width: 50, decoration: BoxDecoration(
                                    color: Palette.backgroundColor,
                                    borderRadius: BorderRadius.all(Radius.circular(50))
                                  ),),
                                  SizedBox(width: 20,),
                                  Expanded(child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Rusmart', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                                      Text('Smk Raden Umar Said', style: TextStyle(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.normal),)
                                    ],
                                  )),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*5/100,right: MediaQuery.of(context).size.width*5/100,top: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*5/100),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Rusmart',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),),
                              Container(child: Padding(child: Text('ANTAR', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 12,)),
                                padding: EdgeInsets.only(top: 5,bottom: 5,left: 15,right: 15,),
                              ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  color: Palette.backgroundColor,
                                ),)
                            ],
                          ),
                          Row(
                            children: [
                              Container(height: 50,width: 50, decoration: BoxDecoration(
                                  color: Palette.backgroundColor,
                                  borderRadius: BorderRadius.all(Radius.circular(50))
                              ),),
                              SizedBox(width: 20,),
                              Expanded(child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Nasi Goreng', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                                  Text('Smk Raden Umar Said', style: TextStyle(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.normal),)
                                ],
                              )),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text('Today - 20 Feb 2023',style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: Colors.black), ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*5/100, right: MediaQuery.of(context).size.width*5/100,  top: 20),
                  child: Container(
                    margin: EdgeInsets.only(right: 50,left: 50,),
                    decoration: BoxDecoration(
                      color: Palette.activeColor3,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text('Batalkan pesanan',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.red), textAlign: TextAlign.center),
                    ),
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
