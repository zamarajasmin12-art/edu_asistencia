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
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue
        ),
        useMaterial3: true,
      ),
      home: const MyLoginPage(),
    );
  }
}// TODO: Estructura base para el módulo de asistencia -  por Oscar
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

