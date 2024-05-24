import 'package:flutter/material.dart';

class CaroselProvider extends ChangeNotifier {
  int current = 0;
  carouselChange(int index) {
    current = index;
    notifyListeners();
  }
}
