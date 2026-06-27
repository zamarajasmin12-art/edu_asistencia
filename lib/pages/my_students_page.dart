import 'package:flutter/material.dart';
import 'package:edu_asistencia/widgets/my_menu_drawer.dart';

class MyStudentsPage extends StatelessWidget {
  const MyStudentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyMenuDrawer(),

      appBar: AppBar(title: const Text("Estudiantes")),

      body: const Center(child: Text("Página de Estudiantes")),
    );
  }
}
