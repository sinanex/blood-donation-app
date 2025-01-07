import 'dart:developer';

import 'package:curd/services/authServices.dart';
import 'package:curd/view/bottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends ChangeNotifier {
  bool isLogged = false;
  String? username;
  String? email;
  String? phone;
  String? bloodGruop;
String? lastDonate;
String? gender;
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
    phone = authservices.supabse.auth.currentUser?.userMetadata?['phone'];
    bloodGruop = authservices.supabse.auth.currentUser?.userMetadata?['blood-group'];
  lastDonate = authservices.supabse.auth.currentUser?.userMetadata?['last-donate'];
    gender = authservices.supabse.auth.currentUser?.userMetadata?['gender'];

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

  Future<void> googleLogin(BuildContext context) async {
     AuthResponse response = await authservices.nativeGoogleSignIn();

     if(response.session != null){
       final user = response.user;
       username = user?.userMetadata?['full_name'];
       log(username.toString());
       _storage.write(key: 'user', value: response.session.toString());
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> BottomBar()));
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
                MaterialPageRoute(builder: (context) => BottomBar()));
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
            context, MaterialPageRoute(builder: (_) => BottomBar()));
      }
    } on AuthApiException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
    notifyListeners();
  }


}
