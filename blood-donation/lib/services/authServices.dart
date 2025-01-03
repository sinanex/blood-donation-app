import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

class Authservices {

  final supabse = Supabase.instance.client;
  Future<void> registerUser({required String name,required String email,required String password}) async {
      Map<String,dynamic> data = {"name":name};
    try {

    final response =  await supabse.auth.signUp(
      data: data,
        password: password,
        email: email,
      );
      if(response.user !=null){
  log("user registered success");
     log("${response.user}");
      }
    } on AuthApiException catch (e) {
      log(e.message);
      if (e.code == 'over_email_send_rate_limit') {
        log("email already exist");
      }
    } catch (e){
      log("$e");
    }
  }


Future<void> loginUser({required String email,required String password}) async {
  try {
    final res = await supabse.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (res.user != null) {
      log("User logged in successfully");
      log("User: ${res.user}");
      
    } else {
      log("Login failed: User is null");
    }
  } on AuthApiException catch (e) {
    log("Authentication error: ${e.message}");
   
  } catch (e) {
    log("Unexpected error: $e");
  }
}

}
