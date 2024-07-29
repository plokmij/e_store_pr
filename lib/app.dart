import 'package:e_store_pr/features/authentication/screens/auth_screen.dart';
import 'package:e_store_pr/features/authentication/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'features/authentication/provider/auth_provider.dart';
import 'features/home/screens/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e Shop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xff0c54be),
          secondary: const Color(0xff303f60),
          surface: const Color(0xfff5f9fd),
        ),
        scaffoldBackgroundColor: const Color(0xfff5f9fd),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          isDense: true,
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: Colors.black,
          ),
        ),
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
            return const AuthScreen();
          }
        },
      ),
    );
  }
}
