import 'package:flutter/material.dart';

class BottomNavProvider extends ChangeNotifier {
  int currentIndex = 0;
  currentIndexChanging(value) {
    currentIndex = value;
    notifyListeners();
  }
}
