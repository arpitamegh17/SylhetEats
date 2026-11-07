import 'package:flutter/material.dart';

import 'screens/login_page.dart';

void main() {
  runApp(const SylhetEatsApp());
}

class SylhetEatsApp extends StatelessWidget {
  const SylhetEatsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SylhetEats',

      theme: ThemeData(
        primaryColor: const Color(0xFF28382F),
        useMaterial3: true,
      ),

      home: const LoginPage(),
    );
  }
}
