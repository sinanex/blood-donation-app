import 'package:curd/view/home.dart';
import 'package:curd/view/request.dart';
import 'package:flutter/material.dart';

class Bottombarcontroller extends ChangeNotifier {
    int currentIndex =0;
 List<Widget> pages = [
  HomePage(),
  RequestPage(),
  RequestPage(),
 ];
    void changeIndex(int value){
      currentIndex = value;
      notifyListeners();
    }
}