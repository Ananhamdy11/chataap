import 'package:flutter/material.dart';
import 'package:chatapp/widget/textinput.dart';
import 'package:chatapp/widget/logorsign.dart';
import 'package:chatapp/widget/constant.dart';
class Interface extends StatelessWidget{
  Interface({super.key});
  
  @override
  Widget build(BuildContext context) {
return Scaffold(
  backgroundColor: kColorpage,
  body: Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Spacer(flex: 4,),
        Image.asset('assets/images/scholar.png'),

        Text('Scholar Chat',style: TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontFamily:'pacifico'
        ),),
    Spacer(flex: 1,),
        LogorSign(label: 'Login',routes: 'Login',),
                SizedBox(height: 10,),
                LogorSign(label: 'SignUp',routes: 'sign',),
                Spacer(flex: 4,)
          ],
        ),

        
      ),
    ),
  );

  }

}