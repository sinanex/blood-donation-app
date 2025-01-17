import 'package:curd/controller/provider.dart';
import 'package:curd/view/editprofile.dart';
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
          builder:(context, value, child) =>  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                ),
                Text('name : ${value.username ??'not provided'}'),
                Text('email : ${value.email ??'not provided'}'),
                Text('Phone : ${value.phone ?? 'not provided'}'),
                Text('Blood group: ${value.bloodGruop ??'not provided'}'),
                Text('Last blood Donate Date : ${value.lastDonate ?? 'not provided'}'),
            
               Row(
                 children: [
                  TextButton(onPressed: (){
               
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Editprofile()));
              
               }, child: Text("Edit Profile")),
                   TextButton(onPressed: (){
                    value.signOut().then((_){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                    });
                   }, child: Text("logout")),
                 ],
               ),
              ],
            ),
          ),
        ),
    );
  }
}