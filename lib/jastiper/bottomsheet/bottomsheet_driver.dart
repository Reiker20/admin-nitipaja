import 'package:flutter/material.dart';
import '/jastiper/buttons/buttons_follow.dart';
import '/config/palette.dart';
import '/jastiper/bottomsheet/bottomsheet_detaildrive.dart';

class BottomSheetDriver extends StatelessWidget {
  const BottomSheetDriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.backgroundColor,
      child: Stack(
        children: [
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Palette.backgroundColor,
                          borderRadius: BorderRadius.all(Radius.circular(50))
                      ),
                      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*15/100, left: MediaQuery.of(context).size.width*5/100),
                      height: 50,
                      width: 50,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*15/100, left: MediaQuery.of(context).size.width*5/100),
                      child: Expanded(child: Row(
                        children: [
                          Text('Driver akan sampai pada', style: TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.bold),),
                          SizedBox(width: MediaQuery.of(context).size.height*1/100,),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                              child: Padding(padding: EdgeInsets.all(5),
                              child: Text('10 menit', style: TextStyle(color: Colors.white, fontSize: 12,fontWeight: FontWeight.bold),)))
                        ],
                      )),
                    )
                  ],
                ),
              ],
            ),
            color: Palette.activeColor,
            height: MediaQuery.of(context).size.height*25/100,
            width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
  }
}
