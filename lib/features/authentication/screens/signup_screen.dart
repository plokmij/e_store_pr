import 'package:e_store_pr/features/authentication/provider/auth_provider.dart';
import 'package:email_validator/email_validator.dart';
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
  String _name = '';
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
            TextFormField(
              decoration: const InputDecoration(hintText: 'Name'),
              validator: (value) =>
                  (value ?? '').isEmpty ? 'Please enter your name' : null,
              onChanged: (value) {
                _name = value;
              },
            ),
            _gap,
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
              validator: (value) => (value ?? '').isEmpty ? 'Password' : null,
              onChanged: (value) {
                _password = value;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<AuthProvider>().signUp(
                        email: _email,
                        name: _name,
                        password: _password,
                      );
                }
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
