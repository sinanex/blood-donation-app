import 'dart:async';
import 'package:curd/view/login.dart';
import 'package:curd/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
   checkLogin();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body: Center(
    child: Text("Splash",style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 30,
    ),),
   ),
    );
  }
  
  void checkLogin() {
    Timer(Duration(seconds: 2), () async{
   FlutterSecureStorage storage = FlutterSecureStorage();
    final session = await  storage.read(key: 'user');
    if(session != null){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>ProfilePage()));
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>LoginPage()));
    }
    },);
  }
}