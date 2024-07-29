import 'features/authentication/provider/auth_view_provider.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'features/authentication/data/repositories/auth_repository.dart';
import 'features/authentication/data/repositories/user_repository.dart';
import 'features/authentication/provider/auth_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(
            authRepository: AuthRepository(),
            userRepository: UserRepository(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthViewProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
