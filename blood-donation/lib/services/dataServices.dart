import 'dart:developer';
import 'dart:io';

import 'package:curd/model/datamodel.dart';
import 'package:curd/model/requst.dart';
import 'package:image_picker/image_picker.dart';
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

  Future<void> addData(Datamodel donerData) async {
    final donersData = donerData.toJson();
    try {
      await supabase.from('doners').insert([donersData]);
    } catch (e) {
      log("$e");
    }
  }


  addRequestData(RequstDatamodel data)async{
    final requstData= data.toJson();
    try {
      await supabase.from('request').insert([requstData]);
    } on PostgrestException catch (e) {
      log(e.message);
    }
    
  }


  getRequstData()async{
    try {
     final data = await supabase.from('request').select('*');
     if(data.isNotEmpty){
      return data.map((data)=>RequstDatamodel.fromJson(data)).toList();
     }
    } catch (e) {
      
    }
  }

  Future<String?> addImageSupabse(XFile imagePAth) async {
    final imageName =
        'images${DateTime.now().millisecondsSinceEpoch.toString()}';
    try {
      await supabase.storage.from('profile').upload(
          imageName, File(imagePAth.path),
          fileOptions: FileOptions(upsert: true));

      final url =
          await supabase.storage.from('profile').getPublicUrl(imageName);
      if (url.isNotEmpty) {
        return url;
      }
    } on StorageException catch (e) {
      log(e.toString());
    }
  }
}
