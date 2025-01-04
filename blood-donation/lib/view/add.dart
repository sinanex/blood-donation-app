

import 'package:curd/controller/dataprovider.dart';

import 'package:curd/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddPage extends StatelessWidget {

  AddPage({super.key});

  String? selectedItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
        title: Text(
          "Add Doner",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        toolbarHeight: 80,
        backgroundColor: const Color(0xFFE8315B),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 10,
              children: [
                SizedBox(
                  height: 20,
                ),
                Consumer<Dataprovider>(
                  builder:(context, value, child) =>  Column(
                    spacing: 10,
                    children: [
                      customTextfeild(lableText: 'name', controller: value.nameController),
                      customTextfeild(lableText: 'age', controller: value.ageController),
                      customTextfeild(
                          lableText: 'phone',
                          controller: value.phoneController,
                          maxLength: 10,
                          type: TextInputType.phone,
                          prefixText: '+91 '),
                           customTextfeild(lableText: 'location', controller: value.locationController),
                    ],
                  ),
                ),
                Consumer<Dataprovider>(
                  builder: (context, dropdown, child) => Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black54,
                        
                      ),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: DropdownButton(
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
                ),
                Consumer<Dataprovider>(
                  builder:(context, radiobton, child) =>  Column(
                    children: [
                      RadioListTile(
                        title: Text("Male"),
                        value: 'male',
                        groupValue: radiobton.groupValue,
                        onChanged: (value) {
                          radiobton.checkRadioBTn(value!);
                        },
                      ),
                      RadioListTile(
                        title: Text("Femail"),
                        value: 'femail',
                        groupValue: radiobton.groupValue,
                        onChanged: (value) {
                            radiobton.checkRadioBTn(value!);
                        },
                      ),
                      RadioListTile(
                        title: Text("other"),
                        value: 'other',
                        groupValue: radiobton.groupValue,
                        onChanged: (value) {
                            radiobton.checkRadioBTn(value!);
                        },
                      ),
                    ],
                  ),
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
                          value.addData().then((_) {
                            // Navigator.pop(context);
                          });
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
