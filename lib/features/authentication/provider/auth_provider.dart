import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../data/models/user_model.dart';
import '../data/repositories/auth_repository.dart';
import '../data/repositories/user_repository.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  AuthProvider({
    required AuthRepository authRepository,
    required UserRepository userRepository,
  })  : _authRepository = authRepository,
        _userRepository = userRepository {
    _authRepository.authStateChanges.listen((User? user) {
      _user = user;
      notifyListeners();
    });
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  User? _user;
  User? get user => _user;
  bool get isLoggedIn => _user != null;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  bool get hasError => _errorMessage != null;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> signIn({required String email, required String password}) async {
    setLoading(true);
    try {
      _user = await _authRepository.signIn(email: email, password: password);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      setLoading(false);
    }
  }

  Future<void> signUp({
    required String email,
    required String name,
    required String password,
  }) async {
    setLoading(true);
    try {
      _user = await _authRepository.signUp(
        email: email,
        name: name,
        password: password,
      );

      final user = UserModel(
        uid: _user!.uid,
        email: _user!.email!,
        name: name,
      );

      await _userRepository.createUser(user);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      setLoading(false);
    }
  }
}
