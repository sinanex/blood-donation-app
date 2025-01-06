import 'dart:convert';
import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Authservices {
  FlutterSecureStorage _storage = FlutterSecureStorage();
  final supabse = Supabase.instance.client;
  Future<String?> registerUser(
      {required String name,
      required String email,
      required String password}) async {
    Map<String, dynamic> data = {"name": name};
    final response = await supabse.auth.signUp(
      data: data,
      password: password,
      email: email,
    );
    if (response.user != null) {
      _storage.write(
          key: 'user', value: jsonEncode(response.session!.toJson()));
      return 'login success';
    }
  }

  Future<String?> loginUser(
      {required String email, required String password}) async {
    final res = await supabse.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (res.session != null) {
      _storage.write(key: 'user', value: jsonEncode(res.session!.toJson()));
      return 'success';
    }
  }

  Future<void> nativeGoogleSignIn() async {
    const webClientId =
        '877061982570-lia1miufldckqojtc20hcum36j2mpmp5.apps.googleusercontent.com';

    const iosClientId =
        '877061982570-lia1miufldckqojtc20hcum36j2mpmp5.apps.googleusercontent.com';

    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: iosClientId,
      serverClientId: webClientId,
    );
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }
    await Supabase.instance.client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }
}
