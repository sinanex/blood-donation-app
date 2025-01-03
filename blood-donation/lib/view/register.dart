import 'dart:developer';

import 'package:curd/services/authServices.dart';
import 'package:curd/view/home.dart';
import 'package:curd/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
   RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SafeArea(
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Column(
            spacing: 20,
            children: [
             customTextfeild(lableText: 'Name',controller: nameController),
             customTextfeild(lableText: 'Email',controller: emailController),
             customTextfeild(lableText: 'Password',controller: passwordController),

                ElevatedButton(onPressed: (){
                  try {
                    Authservices auth = Authservices();
                  auth.registerUser(name: nameController.text, email: emailController.text, password: passwordController.text);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                  } catch (e) {
                    log("$e");
                  }
                }, child: Text("Register")),

                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text("already have account ")),
            ],
           ),
         ),
       ),
    );
  }
}