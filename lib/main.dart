import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const GameVaultApp());
}

class GameVaultApp extends StatelessWidget {
  const GameVaultApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Vault',
      debugShowCheckedModeBanner: false,
      // DEFINISI TEMA DARK SLEEK
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212), // Hitam pekat
        primaryColor: const Color(0xFF03DAC6), // Teal Neon
        cardColor: const Color(0xFF1E1E1E), // Abu-abu gelap untuk card
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF121212),
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white70),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ),
      home: const MainScreen(),
    );
  }
}