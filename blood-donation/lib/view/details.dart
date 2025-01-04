import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DonersDetailsPage extends StatelessWidget {
  String? name;
  String? phone;
  String? group;
   DonersDetailsPage({super.key,required this.group,required this.name,required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CircleAvatar(
            radius: 70,
          ),
          Text(name??''),
          Text(phone??''),
          Text(group??''),

        ],
      ),
    );
  }
}