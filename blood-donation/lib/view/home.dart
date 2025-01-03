import 'package:curd/controller/provider.dart';
import 'package:curd/view/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     Provider.of<AuthController>(context, listen: false).checkSession();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 
    );
  }
}
