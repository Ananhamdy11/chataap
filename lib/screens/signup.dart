import 'package:chatapp/screens/log.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/widget/constant.dart';

import '../helper/snackbar.dart';
import '../widget/logandsignup.dart';
import '../widget/textinput.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget{
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? email;
  String? password;

 bool isloading =false;

 GlobalKey<FormState> formkey= GlobalKey();

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor:kColorpage,
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
                fontFamily:'pacifico'
              ),),
            ],
          ),
            SizedBox(height: 30,),
          Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Sign Up',style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),),
        ],
          ),
          SizedBox(height: 20,),
          TextInput(hinttext: 'E-mail',iconinput: Icon(Icons.email),
          onchange: (data){
            email=data;
          },
          ),
                  SizedBox(height: 10,),
          TextInput(hinttext: 'Password',iconinput: Icon(Icons.password),
          suffixIcon: Icon(Icons.visibility_off),obscuretext: true,
          onchange: (data){
            password=data;
          },),
         
                  SizedBox(height: 10,),
      
          LogandSign(label: 'SignUp',
          onTap:()async{
            if(formkey.currentState!.validate()){
             isloading=true;
             setState(() {
               
             }); 

             try{
                await RegisterUser();
                Navigator.pushNamed(context,'home',arguments: email);
             }

            on FirebaseAuthException catch(ex){
              if(ex.code=='weak-password'){
             Snackbar(context,'weak-password');
              } else if (ex.code == 'email-already-in-use') {
               Snackbar(context,'email-already-in-use');
              }

            }
 catch(ex){
                //Navigator.pushNamed(context,'home',arguments: email);
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
              GestureDetector(
                onTap: (){
                   Navigator.pop(context);
                },
                child: Text('Already have account ?',style: 
                TextStyle(
                  color: Colors.white 
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
);
  }

  Future<void> RegisterUser() async {
       var auth = FirebaseAuth.instance;
       UserCredential user= await auth.createUserWithEmailAndPassword(email: email!, password: password!);
       print(user.user!.displayName!);
  }
}