import 'package:chatapp/widget/constant.dart';
import 'package:flutter/material.dart';

import '../modals/message.dart';

class ChatBubble extends StatelessWidget {
 final Message message;
  const ChatBubble({
    super.key,
    required this.message

  });

  @override
  Widget build(BuildContext context) {
    return     Align(
      alignment: Alignment.centerLeft,
      child: Container(      
        padding: EdgeInsets.only(left: 16,top: 32,bottom: 32,right: 32),
      
        margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      
        decoration: BoxDecoration(
      
          borderRadius: BorderRadius.only(
      
            topLeft: Radius.circular(32),
      
            topRight:  Radius.circular(32),
      
            bottomRight:  Radius.circular(32),
      
          ),
      
          color: kColorpage,
      
      
      
        ),
      
        child: Text(message.message,style: TextStyle(
      
          color: Colors.white
      
        ),),
      
      ),
    );
  }
}



class ChatBubblefriend extends StatelessWidget {
 final Message message;
  const ChatBubblefriend({
    super.key,
    required this.message

  });

  @override
  Widget build(BuildContext context) {
    return     Align(
      alignment: Alignment.centerRight,
      child: Container(      
        padding: EdgeInsets.only(left: 16,top: 32,bottom: 32,right: 32),
      
        margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      
        decoration: BoxDecoration(
      
          borderRadius: BorderRadius.only(
      
            topLeft: Radius.circular(32),
      
            topRight:  Radius.circular(32),
      
            bottomLeft:  Radius.circular(32),
      
          ),
      
          color: Color(0xff006D84),
      
      
      
        ),
      
        child: Text(message.message,style: TextStyle(
      
          color: Colors.white
      
        ),),
      
      ),
    );
  }
}