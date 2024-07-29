import 'package:e_store_pr/features/authentication/provider/auth_provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  final _gap = const SizedBox(
    height: 16,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(
              flex: 1,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Email'),
              validator: (value) =>
                  (value ?? '').isEmpty || EmailValidator.validate(value!)
                      ? null
                      : 'Please enter a valid email',
              onChanged: (value) {
                _email = value;
              },
            ),
            _gap,
            TextFormField(
              decoration: const InputDecoration(hintText: 'Password'),
              obscureText: true,
              validator: (value) =>
                  (value ?? '').isEmpty ? 'Password must not be empty' : null,
              onChanged: (value) {
                _password = value;
              },
            ),
            const Spacer(
              flex: 2,
            ),
            CupertinoButton.filled(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<AuthProvider>().signIn(
                        email: _email,
                        password: _password,
                      );
                }
              },
              child: const Text(
                'Login',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextButton(
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'New here?',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Signup',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
