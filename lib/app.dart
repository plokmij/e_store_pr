import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/authentication/provider/auth_provider.dart';
import 'features/home/screens/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e Shop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Consumer<AuthProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (provider.isLoggedIn) {
            return const HomeScreen();
          } else {
            return const Text('Oombi guys');
          }
        },
      ),
    );
  }
}
