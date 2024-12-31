import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

class Authservices {
  final supabse = Supabase.instance.client;
  Future<void> registerUser() async {
    try {
    await supabse.auth.signUp(
        password: 'sinan123',
        email: '1@gmail.com',
      );
    } on AuthApiException catch (e) {
      log("${e.message}");
      if (e.code == 'over_email_send_rate_limit') {
        log("email already exist");
      }
    }
  }


Future<void> loginUser() async {
  try {
    final res = await supabse.auth.signInWithPassword(
      email: 'muhammedsinanx3@gmail.com',
      password: 'sinan123',
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
