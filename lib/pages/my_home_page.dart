import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  Widget card(
    String titulo,
    IconData icono,
    Color color,
  ) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(icono, size: 40, color: color),
            const SizedBox(height: 10),
            Text(titulo),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [

          card(
            "Registrar Asistencia",
            Icons.qr_code_scanner,
            Colors.green,
          ),

          card(
            "Estudiantes",
            Icons.people,
            Colors.blue,
          ),

          card(
            "Talleres",
            Icons.engineering,
            Colors.orange,
          ),

          card(
            "Reportes",
            Icons.bar_chart,
            Colors.purple,
          ),

          card(
            "Observaciones",
            Icons.note_alt,
            Colors.red,
          ),

          card(
            "Configuración",
            Icons.settings,
            Colors.grey,
          ),
        ],
      ),
    );
  }
}