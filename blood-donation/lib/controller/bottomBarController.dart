

import 'package:curd/view/bloodreq.dart';
import 'package:curd/view/home.dart';
import 'package:curd/view/profile.dart';
import 'package:curd/view/request.dart';
import 'package:flutter/material.dart';

class Bottombarcontroller extends ChangeNotifier {
  int currentIndex = 0;
  List<Widget> pages = [
    HomePage(),
    RequestPage(),
    BloodRequestPage(),
    ProfilePage(),
  ];
  void changeIndex(int value) {
    currentIndex = value;
    notifyListeners();
  }
}
