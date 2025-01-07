import 'package:curd/controller/dataprovider.dart';
import 'package:curd/services/authServices.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Editprofile extends StatelessWidget {
  const Editprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<Dataprovider>(
        builder: (context, provider, child) =>  Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('phone'),
               TextField(
                controller: provider.phoneController,
               ),
                Text('location'),
               TextField(
                controller: provider.locationController,
               ),
                Text('last donate date'),
               TextField(
                readOnly: true,
                  controller:provider.dateController,
                onTap: () {

                     provider.datePicker(context);
                },
               ),
               Text('Blood Group'),
               Consumer<Dataprovider>(
                      builder: (context, dropdown, child) => DropdownButton(
                        hint: Text("select a group"),
                        isExpanded: true,
                        value: dropdown.newValue,
                        items: dropdown.bloodGroupList.map((String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (value) {
                          dropdown.setDropdownValue(value!);
                        },
                      ),
                    ),
                          Row(
                            children: [
                              Flexible(
                                child: RadioListTile(
                                    title: Text("Male"),
                                    value: 'male',
                                    groupValue: provider.groupValue,
                                    onChanged: (value) {
                                      provider.checkRadioBTn(value!);
                                    },
                                  ),
                              ),
                                Flexible(
                                  child: RadioListTile(
                                    title: Text("Femail"),
                                    value: 'femail',
                                    groupValue: provider.groupValue,
                                    onChanged: (value) {
                                        provider.checkRadioBTn(value!);
                                    },
                                  ),
                                ),
                                
                            ],
                          ),
                          Consumer<Dataprovider>(
                      builder: (context, value, child) => Container(
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
                              if (value.newValue == null ) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("select a blood group")));
                              }
                                provider.updateUser();
                            },
                            child: Text('submit',style: TextStyle(
                              fontSize: 20,
                            color: const Color(0xFFE8315B),
                            ),)),
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}