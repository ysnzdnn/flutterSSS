import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food/firebase_options.dart';
import 'package:food/pages/auth/login_page.dart';
import 'package:food/pages/auth/sign_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/loginpage": (context) => LoginPage(),
        "/signup": (context) => SignUp(),
      },
      home: Scaffold(
        body: LoginPage(),
      ),
    );
  }
}
