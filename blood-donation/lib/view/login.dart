import 'dart:developer';

import 'package:curd/services/authServices.dart';
import 'package:curd/view/home.dart';
import 'package:curd/view/register.dart';
import 'package:curd/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
   LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
              width: double.infinity,
              height: 200,
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    "sign into your \n account",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ],
              )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(spacing: 30, children: [
                SizedBox(
                  height: 10,
                ),
                customTextfeild(lableText: 'Email',controller: emailController),
                customTextfeild(lableText: 'password',controller: passwordController),
              ])),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "forgot password?",
                  style: TextStyle(color: Colors.green),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 30,
              children: [
                GestureDetector(
                  onTap: () {
                   try {
                      Authservices auth = Authservices();
                    auth.loginUser(email: emailController.text,password: passwordController.text);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                   } catch (e) {
                     log("$e");
                   }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.lightGreen),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    logincontainer(name: 'Google'),
                    logincontainer(name: 'Facebook'),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account? "),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage()));
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(color: Colors.green),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
