import 'package:flutter/material.dart';
import 'package:chatapp/widget/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../modals/message.dart';
import '../widget/chatbuble.dart';

class Home extends StatelessWidget{
  final ScrollController _controller = ScrollController();

//FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference messages = FirebaseFirestore.instance.collection('messages');
TextEditingController controller=TextEditingController();

@override
Widget build(BuildContext context){
  var email=ModalRoute.of(context)!.settings.arguments;
  return StreamBuilder<QuerySnapshot>(
    stream: messages.orderBy(createdAt,descending: true).snapshots(),
    builder:(context, snapshot){
     if(snapshot.hasData){
      List<Message> messageslist=[];
      for(int i=0;i<snapshot.data!.docs.length;i++){
        messageslist.add(Message.fromJson(snapshot.data!.docs[i]));
      }
       return  Scaffold(
appBar: AppBar(
  automaticallyImplyLeading: false,
  backgroundColor: kColorpage,
  centerTitle: true,
  title:Row(
    mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/scholar.png',height: 50,),
        Text('chat')
      ],

  )
),
body: Column(

  children: [
 Expanded(
child: ListView.builder(
  reverse: true,
  controller: _controller,
  itemCount: messageslist.length,
  itemBuilder: (context,index){
return messageslist[index].id==email?
ChatBubble(message: messageslist[index],
):ChatBubblefriend(message: messageslist[index]);  
 }),

        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: controller,
            onSubmitted: (data){
              messages.add({
                kmessage: data,
                createdAt:DateTime.now(),
                'id':email,
              });
              controller.clear();
              _controller.animateTo(0,
    duration: Duration(seconds: 1),
    curve: Curves.easeIn,
  );
            },
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.send,color: kColorpage,),
              hintText: 'Send Message',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: kColorpage
                )
              )
            ),
          ),
        ),

  ],

)
  );
     }else{
      return Container(color: Colors.white,);
     }
    } ,
    );
}

}

