import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/screens/log.dart';
import 'package:chatapp/screens/interfacepage.dart';
import 'package:chatapp/screens/signup.dart';
import 'package:chatapp/screens/home.dart';

import 'firebase_options.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'Login': (context) =>Log(),
        'sign':(context) => SignUp(),
        'home':(context)=> Home(),

      },
     // initialRoute: 'Login',
        home: Interface(),
        debugShowCheckedModeBanner:false,
    
      );
  }
}





