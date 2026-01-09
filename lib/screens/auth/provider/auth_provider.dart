import "package:flutter/material.dart";

class AuthProvider with ChangeNotifier {

  late PageController openerPageController;
  int currentOpenerValue = 0;
  bool openerCondition = true;

  bool eyeButton1 = true;
  bool eyeButton2 = true;
  bool eyeButton3 = true;
  bool eyeButton4 = true;
  bool eyeButton5 = true;

  bool eyeButtonAllow1 = false;
  bool eyeButtonAllow2 = false;
  bool eyeButtonAllow3 = false;
  bool eyeButtonAllow4 = false;
  bool eyeButtonAllow5 = false;


  void update() {
    notifyListeners();
  }

  void createOpenerController() {
    openerPageController = PageController();
  }

  void disposeOpenerController() {
    openerCondition = false;
    openerPageController.dispose();
  }

  void changeEyeIcon({required int number}) {
    if (number == 1) eyeButton1 = !eyeButton1;
    if (number == 2) eyeButton2 = !eyeButton2;
    if (number == 3) eyeButton3 = !eyeButton3;
    if (number == 4) eyeButton4 = !eyeButton4;
    if (number == 5) eyeButton5 = !eyeButton5;
    update();
  }

  void changeEyeIconAllow({required int number, required bool value}) {
    if (number == 1) eyeButtonAllow1 = value;
    if (number == 2) eyeButtonAllow2 = value;
    if (number == 3) eyeButtonAllow3 = value;
    if (number == 4) eyeButtonAllow4 = value;
    if (number == 5) eyeButtonAllow5 = value;
    update();
  }

  void changeOpenerPageLoop() async {
    while (openerCondition) {
      await Future.delayed(Duration(seconds: 3), () {
        if (currentOpenerValue == 0) {
          openerPageController.animateToPage(
            1,
            duration: Duration(milliseconds: 700),
            curve: Curves.linear,
          );
          currentOpenerValue = 1;
        } else {
          openerPageController.animateToPage(
            0,
            duration: Duration(milliseconds: 700),
            curve: Curves.linear,
          );
          currentOpenerValue = 0;
        }
        Future.delayed(Duration(milliseconds: 700), () {
        update();
        },);
      });

    }
  }
}
