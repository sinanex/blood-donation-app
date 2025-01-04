import 'dart:developer';
import 'dart:io';

import 'package:curd/model/datamodel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Dataservices {
  final supabase = Supabase.instance.client;

  Future<List<Datamodel>> getData() async {
    try {
      final data = await supabase.from('doners').select('*');

      if (data.isNotEmpty) {
        return data.map((json) => Datamodel.fromJson(json)).toList();
      }
    } catch (e) {
      log("$e");
    }
    return [];
  }
  Future<void> addData(Datamodel donerData)async{
     final _donersData = donerData.toJson();
    try {
   await supabase.from('doners').insert([_donersData]);
    } catch (e) {
      log("$e");
    }
  }

  // Future<void> addImage(var imagePath)async{

  //   File image = File(imagePath.path);
  //   try {
  //     final imagePath = "image"+ DateTime.now().microsecondsSinceEpoch.toString();
  //    final  storage = await supabase.storage.from('profile').upload(imagePath, image);
     
  //   } catch (e) {
      
  //   }
  // }
}

