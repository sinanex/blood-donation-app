import 'dart:developer';

import 'package:curd/controller/dataprovider.dart';
import 'package:curd/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BloodRequestPage extends StatelessWidget {
  const BloodRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Request',style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white
        ),),
        toolbarHeight: 80,
        backgroundColor: Constants.mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),

        ),
      ),
      body: Consumer<Dataprovider>(
        builder:(context, provider, child) =>  Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              Text("name"),
              TextField(
                controller: provider.nameController,
              ),
                Text("phone"),
              TextField(
                controller: provider.phoneController,
              ),
              Text('Blood Group'),
             DropdownButton<String>(
              hint: Text('select group'),
              isExpanded: true,
            value: provider.newValue, 
            items: provider.bloodGroupList.map((String item) {
              return DropdownMenuItem<String>(
                value: item, 
                child: Text(item), 
              );
            }).toList(),
            onChanged: (String? value) {
              if (value != null) {
                provider.setDropdownValue(value); 
              }
            },
          ),
          
               Text("number of unit"),
              TextField(
                controller: provider.unitController,
              ),
              Text('Hospital Name'),
              TextField(
                controller: provider.HospitalController,
              ),
           Text('Date'),
           TextField(
            
            onTap: () {
              provider.datePicker(context);
            },
            controller: provider.dateController,
           ),
          
              Row(
                children: [
                  Flexible(
                    child: RadioListTile(
                      title: Text("Male"),
                      activeColor: Constants.mainColor,
                      value: 'male', groupValue: provider.groupValue, onChanged: (value) {
                                   provider.checkRadioBTn(value!);
                                },),
                  ),
              Flexible(
                child: RadioListTile(
                  title: Text('Female'),
                           activeColor: Constants.mainColor,
                  value: 'female', groupValue: provider.groupValue, onChanged: (value) {
                       provider.checkRadioBTn(value!);
                },),
              ),
              
                ],
              ),
              Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                           color: const Color(0xFFE8315B),
                      )
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white
                      ),
                        onPressed: () {
                          if (provider.newValue == null ) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("select a blood group")));
                          }
                          provider.addRequestData().then((_) {
                            log("data added");
                          });
                        },
                        child: Text('submit',style: TextStyle(
                          fontSize: 20,
                        color: const Color(0xFFE8315B),
                        ),)),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}