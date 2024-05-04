import 'package:flutter/material.dart';
import 'package:getx_login/screens/login.dart';
import 'package:get/get.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          primaryColor: Colors.blue
      ),
      home: LoginPage(),
    );
  }
}