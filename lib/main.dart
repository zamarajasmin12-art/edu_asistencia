import 'package:edu_asistencia/pages/my_login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edu - Asistencia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 51, 86, 114),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      home: const MyLoginPage(),
    );
  }
}

class AsistenciaModulo {
  final String usuarioId;
  final DateTime fechaRegistro;
  bool asistio;

  AsistenciaModulo({
    required this.usuarioId,
    required this.fechaRegistro,
    this.asistio = false,
  });
}
