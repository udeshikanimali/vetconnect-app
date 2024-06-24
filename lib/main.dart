import 'package:flutter/material.dart';
import 'package:vetconnect_app/View/auth/signin.dart';
import 'package:vetconnect_app/mobile_scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: const SignIn(),
    );
  }
}




