import 'package:flutter/material.dart';

class AuthViewProvider extends ChangeNotifier {
  bool _isLoginView = true;

  bool get isLoginView => _isLoginView;

  void toggleView() {
    _isLoginView = !_isLoginView;
    notifyListeners();
  }
}
