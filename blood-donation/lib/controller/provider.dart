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
FlutterSecureStorage _storage = FlutterSecureStorage();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
    await authservices.nativeGoogleSignIn();
    notifyListeners();
  }

  Future<void> emailRegister() async {
  try {
        authservices.registerUser(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text);
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  } on AuthApiException catch (e) {
    log(e.message);

  };
      notifyListeners();
  }
  Future<void> loginUser(
    BuildContext context
  )async{
  try {
      final response = await authservices.loginUser(email: emailController.text, password: passwordController.text); 
 if(response != null){
  log("login success");
  Navigator.push(context, MaterialPageRoute(builder: (_)=>ProfilePage()));
 }
  } on AuthApiException catch (e) {
    log(e.message);
  }
    notifyListeners();
  }
}
