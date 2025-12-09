import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

class AppColors {
  static const background = Color(0xFFF4F6F8);
  static const headerGradientStart = Color(0xFF00C569);
  static const headerGradientEnd = Color(0xFF0FA574);
}

void main() {
  runApp(const TaabatApp());
}

class TaabatApp extends StatelessWidget {
  const TaabatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taabat App',
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: AppColors.background,
      ),
      home: const LoginScreen(),
    );
  }
}
