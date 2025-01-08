import 'package:flutter/material.dart';

class Donerviewpage extends StatelessWidget {
  String? name;
  String? phone;
  String? bloodGruop;
  String? location;
  String?image;
  String? age;
  String? gender;

   Donerviewpage({super.key,required this.image,required this.age,required this.bloodGruop,required this.gender,required this.location,required this.name,required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 70,
            backgroundImage: image != null? NetworkImage(
              image!,):AssetImage('assets/add-user.png'),
          ),
          Text('name : $name'),
          Text('phone : $phone'),
          Text('blood group : $bloodGruop'),
          Text('location : $location'),
          Text('age : $age'),
          Text('gender : $gender'),
        ],
      ),
    );
  }
}