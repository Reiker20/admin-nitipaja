import 'package:flutter/material.dart';
import '/config/palette.dart';

class MessageTile extends StatelessWidget {
  var messageType, messageContent,image;

  MessageTile({Key? key, this.messageType,this.messageContent,this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Align(
        alignment: (messageType?Alignment.topLeft:Alignment.topRight),
        child: Row(
          mainAxisAlignment: messageType?MainAxisAlignment.end:MainAxisAlignment.start,
          children: [
            !messageType?CircleAvatar(
              backgroundImage: NetworkImage(image),
            ):SizedBox(),
            SizedBox(width: 10,),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: messageType? Palette.TextColor2:Palette.activeColor),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              padding: EdgeInsets.all(10),
              child: Text(messageContent, style: TextStyle(fontSize: 15),),
            ),
            SizedBox(width: 10,),
          ],
        ),
      ),
    );
  }
}
