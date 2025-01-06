import 'package:curd/controller/provider.dart';
import 'package:curd/view/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
   ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
    Provider.of<AuthController>(context,listen: false).checkSession();
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<AuthController>(
          builder:(context, value, child) =>  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
              ),
              Text('name : ${value.username ??''}'),
              Text('email : ${value.email ??''}'),

             TextButton(onPressed: (){
              value.signOut().then((_){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
              });
             }, child: Text("logout"))
            ],
          ),
        ),
    );
  }
}