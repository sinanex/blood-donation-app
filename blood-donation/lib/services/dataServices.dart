import 'dart:developer';

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
     final donersData = donerData.toJson();
    try {
   await supabase.from('doners').insert([donersData]);
    } catch (e) {
      log("$e");
    }
  }

}

