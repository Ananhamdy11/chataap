import 'package:flutter/material.dart';
class LogandSign extends StatelessWidget{
  LogandSign({this.onTap,required this.label});

String label;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
return GestureDetector(
  onTap: onTap,
  child:   Container(
  
    height: 50,
  
    width: double.infinity,
  
    decoration: BoxDecoration(
  
      color: Colors.white,
  
      borderRadius: BorderRadius.circular(8)
  
    ),
  
  child: Center(
  
    child:   Text(label,
  
    style:TextStyle(
  
      fontSize: 20,
  
      fontWeight:FontWeight.bold
  
    ) ,),
  
  )
  
  
  
  ),
);
  }
}