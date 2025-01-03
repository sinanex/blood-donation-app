import 'dart:developer';

import 'package:curd/services/authServices.dart';
import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  bool isLogged = false;
  String? username;
  Authservices authservices = Authservices();
  void checkSession() async {
   final session =  authservices.supabse.auth.currentSession;
    username = authservices.supabse.auth.currentUser?.userMetadata?['name'];
   if(session != null){
  isLogged = true;
   }else{
    isLogged = false;
   }
   notifyListeners();
  }
  Future<void> signOut()async{
    authservices.supabse.auth.signOut();
       final session =  authservices.supabse.auth.currentSession;
       if(session == null){
        log("user logout success");
       }
    isLogged = false;
    notifyListeners();
  }
}
