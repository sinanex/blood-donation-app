import 'dart:developer';

import 'package:curd/model/datamodel.dart';
import 'package:curd/services/dataServices.dart';
import 'package:flutter/material.dart';

class Dataprovider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  List<Datamodel> dataList = [];
  List<Datamodel> filterList = [];
  List<String> bloodGroupList = [
    'A+',
    'AB+',
    'AB-',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-'
  ];

  String? groupValue = 'male';

  String? newValue;
  Dataservices dataservices = Dataservices();
  void getData() async {
    dataList = await dataservices.getData();
    notifyListeners();
  }

  Future addData() async {
    final data = Datamodel(
      age: ageController.text,
        group: newValue,
        name: nameController.text,
        phone: phoneController.text,
        location: locationController.text,
        gender: groupValue);
    dataservices.addData(data);
    nameController.clear();
    phoneController.clear();
    locationController.clear();
    ageController.clear();
    groupValue = 'male';
    newValue = null;
    notifyListeners();
  }

  void serchDoners() {
    
    filterList =
        dataList.where((doners) => doners.location == locationController.text).toList();

    notifyListeners();
  }

  void setDropdownValue(String value) async {
    newValue = value;
    notifyListeners();
  }

  void checkRadioBTn(String value) {
    groupValue = value;
    notifyListeners();
  }
}
