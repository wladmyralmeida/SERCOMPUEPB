import 'package:flutter/material.dart';
import 'package:todoapp/app/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD App - Sercomp & Sertāo Desenvolve',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Colors.orange,
          onPrimary: Color(0xFFFEFEFE), //PARA TEXTOS
          secondary: Colors.orangeAccent,
          onSecondary: Color(0xFF171717),
          error: Color(0xFFFF5252),
          onError: Color(0xFFFF5252),
          background: Colors.grey,
          onBackground: Colors.grey,
          surface: Colors.orangeAccent,
          onSurface: Colors.white,
        ),
        fontFamily: 'Georgia',
      ),
      home: const HomePage(title: 'Lista de Coisas a Fazer - TODO'),
    );
  }
}
