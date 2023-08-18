import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/palette.dart';
import '../controller/buidnavbar.dart';

class BuildNavBar extends StatefulWidget {
  var navbar,lastNavbar;

  BuildNavBar({Key? key, this.navbar,this.lastNavbar}) : super(key: key);

  @override
  State<BuildNavBar> createState() => _BuildNavBarState();
}

class _BuildNavBarState extends State<BuildNavBar> {
  int index_pick =0;
  List<String> _hisTrans = ['Berlangsung', 'Berhasil', 'Dibatalkan'];
  List<String> _chat = ['Semua Pesan', 'Teman Anda'];
  List<String> _category = ['Makanan', 'Minuman','Pakaian','Elektronik','Barang Lainnya'];
  List<String> _profile = ['Profil Pengguna', 'Settings'];

  BuildNavBarController c = Get.put(BuildNavBarController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.lastNavbar!=null?
        index_pick=int.parse(widget.lastNavbar.toString()):
        index_pick=0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      height: MediaQuery.of(context).size.height*5/100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.navbar==0?_hisTrans.length:widget.navbar==1?_chat.length:widget.navbar==2?_category.length:_profile.length,
        itemBuilder:(context, index) {
          return InkWell(
            onTap: (){
              setState(() {
                if(widget.navbar==0){
                  if(index==0){
                    index_pick=0;
                    c.pageHistory.value=0;
                  }else if(index==1) {
                    index_pick = 1;
                    c.pageHistory.value =1;
                  }else if(index==2) {
                    index_pick = 2;
                    c.pageHistory.value =2;
                  }else {
                    index_pick = 4;
                  }
                }
                else if(widget.navbar==1){
                  if(index==0){
                    index_pick = 0;
                    c.pageChat.value = 0;
                  }else{
                    index_pick = 1;
                    c.pageChat.value = 1;
                  }
              }
                else if(widget.navbar==2){
                  if(index==0){
                    index_pick=0;
                    c.pageCategory.value = 0;
                  }else if(index==1) {
                    index_pick = 1;
                    c.pageCategory.value = 1;
                  }else if(index==2) {
                    index_pick = 2;
                    c.pageCategory.value = 2;
                  }else if(index==3){
                    index_pick = 3;
                    c.pageCategory.value = 3;
                  }else {
                    index_pick = 4;
                    c.pageCategory.value = 4;
                  }
                }else if(widget.navbar==3){
                  if(index==0){
                    index_pick=0;
                    c.pageProfile.value = 0;
                  }else{
                    index_pick = 1;
                    c.pageProfile.value = 1;
                  }
                }
              });
              print(c.pageProfile);
              print(index_pick);
            },
            child: Container(
              margin: EdgeInsets.only(left:2, right: 3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: index_pick==index?Palette.activeColor:Colors.white,
                  border: index_pick!=index?Border.all(color: Colors.grey):null
              ),
              child: Container(
                margin: index==1?
                widget.navbar==0?EdgeInsets.only(left: MediaQuery.of(context).size.width*5/100, right: MediaQuery.of(context).size.width*5/100, top: 10, bottom: 10)
                    :widget.navbar==3?EdgeInsets.only(left: MediaQuery.of(context).size.width*15/100, right: MediaQuery.of(context).size.width*15/100, top: 10, bottom: 10)
                    :EdgeInsets.only(left: MediaQuery.of(context).size.width*10/100, right: MediaQuery.of(context).size.width*10/100, top: 10, bottom: 10)
                    :index==2?EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10)
                    :widget.navbar==0?EdgeInsets.only(right: MediaQuery.of(context).size.width*5/100,left: MediaQuery.of(context).size.width*5/100,bottom: 10,top: 10)
                    :widget.navbar==3? index==0? EdgeInsets.only(left: MediaQuery.of(context).size.width*8/100, right: MediaQuery.of(context).size.width*8/100, top: 10, bottom: 10)
                    : EdgeInsets.only(left: MediaQuery.of(context).size.width*15/100, right: MediaQuery.of(context).size.width*15/100, top: 10, bottom: 10)
                    :EdgeInsets.only(left: 35, right: 35, top: 10, bottom: 10),
                child: Text(widget.navbar==0?_hisTrans[index]:widget.navbar==1?_chat[index]:widget.navbar==2?_category[index]:_profile[index],
                    style: TextStyle(color: index_pick==index? Colors.white:Colors.black54, fontSize: widget.navbar==0?15:15, fontWeight: FontWeight.normal)),
              ),
            ),
          );
        },
      ),
    );
  }

}
