import 'package:curd/services/authServices.dart';
import 'package:curd/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SafeArea(
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Column(
            spacing: 20,
            children: [
             customTextfeild(lableText: 'Name'),
             customTextfeild(lableText: 'Email'),
             customTextfeild(lableText: 'Password'),

                ElevatedButton(onPressed: (){
                  Authservices auth = Authservices();
                  auth.registerUser();
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