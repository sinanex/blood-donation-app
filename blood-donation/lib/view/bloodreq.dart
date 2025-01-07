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
              TextField(),
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
                provider.setDropdownValue(value); // Update the provider's selected value
              }
            },
          ),
          
               Text("number of unit"),
              TextField(),
              Text('Hospital Name'),
              TextField(),
           Text('Date'),
           TextField(),
          
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
              )
            ],
          ),
        ),
      ),
    );
  }
}