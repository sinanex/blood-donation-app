import 'dart:developer';

import 'package:curd/model/datamodel.dart';
import 'package:curd/services/authServices.dart';
import 'package:curd/services/dataServices.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class Dataprovider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController HospitalController = TextEditingController();
  TextEditingController unitController = TextEditingController();
  List<Datamodel> dataList = [];
  List<Datamodel> filterList = [];
  String? date;
  XFile? imageFile;
  String? imageUrl;
  bool? isLodding = false;
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
  Authservices authservices = Authservices();
  void getData() async {
    dataList = await dataservices.getData();
    notifyListeners();
  }

  Future addData() async {
    final  data =  Datamodel(
      image: imageUrl,
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
    filterList = dataList
        .where((doners) =>
            doners.location == locationController.text &&
            doners.group == newValue)
        .toList();

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

  void datePicker(BuildContext context)async{
    log("date btn taped");
     final dateData =await  showDatePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime(2100),initialDate: DateTime.now());

     if(dateData !=null){
    dateController.text = DateFormat('dd/MM/yyyy').format(dateData);
     }
     notifyListeners();
  }

  void updateUser()async{
    authservices.updateUserData(location: locationController.text, blood: newValue!, date: dateController.text, phone: phoneController.text, gender: groupValue!);
  }

  void imageAdd()async{
       final image = await  ImagePicker().pickImage(source: ImageSource.gallery);

       if(image != null){
        imageFile = image;
       }
       getImageUrl();
       notifyListeners();
  }

  void getImageUrl() async {

  final imagePath = await dataservices.addImageSupabse(imageFile!);

  if (imagePath != null) {

    imageUrl = imagePath;
        log("Image path received successfully: $imageUrl");
  } else {
    log("Image URL is null");
  }

  notifyListeners(); 
}

}
