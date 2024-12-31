import 'dart:developer';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> addData() async {
  log("workinggg");
  final supabase = Supabase.instance.client;

  try {
    await supabase.from('name').insert({
      "name": "hwjfbirbf",
    });

    log("Data inserted successfully");
  } catch (e) {
    log("Error while inserting data: $e");
  }
}
