import 'package:chatapp/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/widget/textinput.dart';
import 'package:chatapp/widget/logandsignup.dart';
import 'package:chatapp/widget/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/snackbar.dart';
class Log extends StatefulWidget{
  @override
  State<Log> createState() => _LogState();
}

class _LogState extends State<Log> {
  String? email;

  String? password;
  bool isloading=false;


  

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
return ModalProgressHUD(
  inAsyncCall: isloading,
  child:   Scaffold(
      backgroundColor: kColorpage,
      body: Center(      
        child: Padding(
   padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Form(
            key: formkey,
            child: ListView(
    children: [
   SizedBox(height: 70,),
  Image.asset('assets/images/scholar.png',height: 100,),
 Row(
   mainAxisAlignment: MainAxisAlignment.center,
   children: [
  
                  Text('Scholar Chat',style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily:'pacifico' ),),],
  
    
  
              ),
  
                SizedBox(height: 30,),
    Row(
  
            mainAxisAlignment: MainAxisAlignment.center,
  
            children: [
              Text('Login',style: TextStyle(
  
                    color: Colors.white,
  
                    fontSize: 25,
  
                    fontWeight: FontWeight.bold
  
                  ),), ],
  
    
              ),
              SizedBox(height: 20,),
  
              TextInput(hinttext: 'E-mail',iconinput: Icon(Icons.email),
  
              onchange:(data){
  
                email=data;
  
              },),
  SizedBox(height: 10,),
  
    
  
  TextInput(hinttext: 'Password',iconinput: Icon(Icons.password),suffixIcon: Icon(Icons.visibility_off),
             obscuretext: true,
              onchange:(data){
               password=data;
               },
  
    
  
              ),
  
    
  
                      SizedBox(height: 10,),
  
    
  
          
  
    
  
              LogandSign(label: 'Login',onTap: ()async{
  
    
  
                if (formkey.currentState!.validate()) {
               isloading=true;
               setState(() {
                 
               });
    
  
      try{
  
    
  
         await LoginUser();
         Navigator.pushNamed(context,'home',arguments: email);
    
  
      }
  
    
  
                 on FirebaseAuthException catch(ex){
  
    
  
       if (ex.code == 'user-not-found') {
  
    
  
       Snackbar(context,'No user found for that email.');
  
    
  
       } else if (ex.code =='wrong-password') {
  
    
  
       Snackbar(context,'Wrong password provided for that user.');
   }
 }
  
    
  
      catch(ex){
  
      Snackbar(context,'there was an error !');
      }
      isloading=false;
      setState((){});
    
  
  
    
  
    }else{}
  
    
  
              }
  ),
  SizedBox(height: 10,),
  Row(
mainAxisAlignment: MainAxisAlignment.center,
  
                children: [
  Text('You don\'t have account ?',style: 
  
    
  
                  TextStyle(
  
    
  
                    color: Colors.white 
  
    
  
                  ),),
  
    
  
                  GestureDetector(
  
    
  
                    onTap:(){ Navigator.pushNamed(context, 'sign');
  
    
  
                    },
  
    
  
                    child: Text('  SignUp',style: 
  
    
  
                    TextStyle(
  
    
  
                      color: Color(0xffC7EDE6)
  
    
  
                    ),),
  
    
  
                  ),
  
    
  
          
  
    
  
                ],
  
    
  
              ),
  
    
  
                SizedBox(height: 70,),
  
              ],
  
            ),
  
          ),
  
    
  
        ),
  
    
  
      ),
  
  ),
);
  }

  

  Future<void> LoginUser() async {
    var auth = FirebaseAuth.instance;
         UserCredential user= await auth.signInWithEmailAndPassword(email: email!, password: password!);
  }
}