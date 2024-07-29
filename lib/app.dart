import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/styles/theme.dart';
import 'features/authentication/provider/auth_provider.dart';
import 'features/authentication/screens/auth_screen.dart';
import 'features/home/screens/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e Shop',
      theme: AppTheme.theme,
      home: Consumer<AuthProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (provider.isLoggedIn) {
            return const HomeScreen();
          } else {
            return const AuthScreen();
          }
        },
      ),
    );
  }
}
