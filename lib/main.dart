import 'package:flutter/material.dart';
import 'package:todoapp/app/home/home_page.dart';
import 'package:todoapp/core/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = true; // ✅ Começa no tema escuro

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Supermercado',
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
      home: HomePage(title: 'Tauste Supermarket', onToggleTheme: toggleTheme),
    );
  }
}
