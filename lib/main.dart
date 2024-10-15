import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/Auth/auth_page.dart';
import 'package:grocery_app/firebase_options.dart';
import 'package:grocery_app/screens/dashboard/dashboard_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'auth', // Set an initial route
      routes: {
        // 'splash': (context) => SplashScreen(),
        'auth': (context) => const AuthPage(),
        'Dashboard': (context) => DashboardScreen(),
      },
    );
  }
}
