import 'package:flutter/material.dart';
class LogorSign extends StatelessWidget{
  LogorSign({required this.label,required this.routes});

String label;
  String routes;

  @override
  Widget build(BuildContext context) {
return GestureDetector(
  onTap: (){
    Navigator.pushNamed(context, routes);
  },
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