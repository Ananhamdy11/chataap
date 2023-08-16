import 'package:flutter/material.dart';
class TextInput extends StatelessWidget{
  TextInput({this.hinttext,this.iconinput,this.suffixIcon,this.onchange,this.obscuretext=false});

String? hinttext;
Icon? iconinput;
Icon? suffixIcon;

bool? obscuretext;
Function(String)? onchange;
  
  @override
  Widget build(BuildContext context) {
return TextFormField(
  validator: (data){
    if(data!.isEmpty){
      return 'Field is required';
    }
  },
  obscureText: obscuretext!,
  onChanged: onchange,
        decoration: InputDecoration(
          prefixIcon:iconinput,
          suffixIcon: suffixIcon,
        
           //Icon(Icons.email),
          hintText: hinttext,
          hintStyle: TextStyle(
            color: Colors.white,
          ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white
            )
          ) ,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white
            )
          )
        ),
      );
  }
}