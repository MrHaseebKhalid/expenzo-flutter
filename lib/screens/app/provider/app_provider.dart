import 'package:flutter/cupertino.dart';

class AppProvider extends ChangeNotifier {

  int currentPageIndex = 0;


  void update() {
    notifyListeners();
  }

  void changePageIndex(int newIndex) {
    currentPageIndex = newIndex;
    update();
  }
}