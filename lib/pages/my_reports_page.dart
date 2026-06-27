import 'package:flutter/material.dart';
import 'package:edu_asistencia/widgets/my_menu_drawer.dart';

class MyReportsPage extends StatelessWidget {
  const MyReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyMenuDrawer(),

      appBar: AppBar(title: const Text("Reportes")),
      body: const Center(
        child: Text("Reportes de Asistencia", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
