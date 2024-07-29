import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';
import '../provider/auth_view_provider.dart';
import '../widgets/login_form.dart';
import '../widgets/signup_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'e-Shop',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, _) {
          if (authProvider.hasError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(authProvider.errorMessage!),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                  margin: const EdgeInsets.all(20),
                ),
              );
            });
          }
          return Consumer<AuthViewProvider>(
            builder: (context, prov, _) {
              return prov.isLoginView ? const LoginForm() : const SignupForm();
            },
          );
        },
      ),
    );
  }
}
