import 'package:curd/controller/provider.dart';
import 'package:curd/view/home.dart';
import 'package:curd/view/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context,listen: false);
    return authController.isLogged ? HomePage() : LoginPage();
  }
}
