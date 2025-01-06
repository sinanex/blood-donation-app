import 'dart:developer';

import 'package:curd/services/authServices.dart';
import 'package:curd/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends ChangeNotifier {
  bool isLogged = false;
  String? username;
  String? email;
  Authservices authservices = Authservices();
  final FlutterSecureStorage _storage = FlutterSecureStorage();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confromPassController = TextEditingController();
  void checkSession() async {
    final session = authservices.supabse.auth.currentSession;
    username = authservices.supabse.auth.currentUser?.userMetadata?['name'];
    email = authservices.supabse.auth.currentUser?.userMetadata?['email'];

    if (session != null) {
      isLogged = true;
    } else {
      isLogged = false;
    }
    notifyListeners();
  }

  Future<void> signOut() async {
    authservices.supabse.auth.signOut();

    final session = authservices.supabse.auth.currentSession;
    if (session == null) {
      log("user logout success");
      _storage.delete(key: 'user');
    }
    isLogged = false;
    notifyListeners();
  }

  Future<void> googleLogin() async {
     AuthResponse response = await authservices.nativeGoogleSignIn();

     if(response.session != null){
       final user = response.user;
       username = user?.userMetadata?['full_name'];
       log(username.toString());
       _storage.write(key: 'user', value: response.session.toString());
       
     }
    
    notifyListeners();
  }

  Future<void> emailRegister(BuildContext context) async {
    if (passwordController.text == confromPassController.text) {
      if (passwordController.text.length > 6) {
        try {
          final response = await authservices.registerUser(
              name: nameController.text,
              email: emailController.text,
              password: passwordController.text);
          nameController.clear();
          emailController.clear();
          passwordController.clear();
          if (response != null) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => ProfilePage()));
          }
        } on AuthApiException catch (e) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(e.message)));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("password minimum 6 charactor")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("password not match")));
    }

    notifyListeners();
  }

  Future<void> loginUser(BuildContext context) async {
    try {
      final response = await authservices.loginUser(
          email: emailController.text, password: passwordController.text);
      if (response != null) {
        log("login success");
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => ProfilePage()));
      }
    } on AuthApiException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
    notifyListeners();
  }


}
