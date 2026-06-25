import "dart:async";

import "package:flutter/material.dart";
import "package:firebase_auth/firebase_auth.dart";
import "../services/auth_service.dart";

/// Account state enumeration
enum AccountState {
  guest, // Not logged in
  unverified, // Logged in but email not verified
  verified, // Logged in and email verified
}

class AuthProvider with ChangeNotifier {
  late PageController openerPageController;
  int currentOpenerValue = 0;
  bool openerCondition = true;
  String userFirstName = "Mark";
  String userSecondName = "Rober";

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

  // Firebase Authentication State
  final AuthService _authService = AuthService.instance;
  User? _user;
  bool _isLoading = false;
  String? _errorMessage;
  StreamSubscription<User?>? _authSubscription;
  AccountState _accountState = AccountState.guest;

  User? get user => _user;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isAuthenticated => _user != null;
  bool get isEmailVerified => _user?.emailVerified ?? false;
  AccountState get accountState => _accountState;

  AuthProvider() {
    _initAuth();
  }

  void _initAuth() {
    _authSubscription = _authService.authStateChanges.listen((User? user) {
      _user = user;

      // Update account state based on user status
      if (user == null) {
        _accountState = AccountState.guest;
      } else if (user.emailVerified == true) {
        _accountState = AccountState.verified;
      } else {
        _accountState = AccountState.unverified;
      }

      notifyListeners();
    });
  }

  @override
  void dispose() {
    _authSubscription?.cancel();
    super.dispose();
  }

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
        if (!openerCondition) return; // Check condition before proceeding

        try {
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
            if (openerCondition) update();
          });
        } catch (e) {
          // Ignore errors if PageController is disposed
          debugPrint('PageController error in changeOpenerPageLoop: $e');
        }
      });
    }
  }

  // Firebase Authentication Methods

  Future<void> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      await _authService.registerWithEmailAndPassword(
        email: email,
        password: password,
      );

      _isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      _isLoading = false;
      _errorMessage = _getErrorMessage(e.code);
      notifyListeners();
      rethrow;
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'An unexpected error occurred. Please try again.';
      notifyListeners();
      rethrow;
    }
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      await _authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      _isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      _isLoading = false;
      _errorMessage = _getErrorMessage(e.code);
      notifyListeners();
      rethrow;
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'An unexpected error occurred. Please try again.';
      notifyListeners();
      rethrow;
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      await _authService.sendPasswordResetEmail(email);

      _isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      _isLoading = false;
      _errorMessage = _getErrorMessage(e.code);
      notifyListeners();
      rethrow;
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'An unexpected error occurred. Please try again.';
      notifyListeners();
      rethrow;
    }
  }

  Future<void> confirmPasswordReset({
    required String code,
    required String newPassword,
  }) async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      await _authService.confirmPasswordReset(
        code: code,
        newPassword: newPassword,
      );

      _isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      _isLoading = false;
      _errorMessage = _getErrorMessage(e.code);
      notifyListeners();
      rethrow;
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'An unexpected error occurred. Please try again.';
      notifyListeners();
      rethrow;
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      await _authService.sendEmailVerification();

      _isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      _isLoading = false;
      _errorMessage = _getErrorMessage(e.code);
      notifyListeners();
      rethrow;
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'An unexpected error occurred. Please try again.';
      notifyListeners();
      rethrow;
    }
  }

  Future<void> reloadUser() async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      await _authService.reloadUser();

      // Update _user with fresh data from Firebase after reload
      _user = FirebaseAuth.instance.currentUser;
      notifyListeners();

      _isLoading = false;
    } on FirebaseAuthException catch (e) {
      _isLoading = false;
      _errorMessage = _getErrorMessage(e.code);
      notifyListeners();
      rethrow;
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'An unexpected error occurred. Please try again.';
      notifyListeners();
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      await _authService.signOut();

      _isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      _isLoading = false;
      _errorMessage = _getErrorMessage(e.code);
      notifyListeners();
      rethrow;
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'An unexpected error occurred. Please try again.';
      notifyListeners();
      rethrow;
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  String _getErrorMessage(String code) {
    switch (code) {
      case 'user-not-found':
        return 'No user found with this email.';
      case 'wrong-password':
        return 'Wrong password provided.';
      case 'email-already-in-use':
        return 'Email already in use.';
      case 'invalid-email':
        return 'Invalid email address.';
      case 'weak-password':
        return 'Password is too weak.';
      case 'user-disabled':
        return 'User account has been disabled.';
      case 'too-many-requests':
        return 'Too many requests. Try again later.';
      case 'invalid-verification-code':
        return 'Invalid verification code. Please try again.';
      case 'expired-action-code':
        return 'The verification link has expired. Please request a new one.';
      case 'email-not-verified':
        return 'Please verify your email before continuing.';
      default:
        return 'An error occurred. Please try again.';
    }
  }
}
