import 'package:flutter/material.dart';
import 'package:edu_asistencia/widgets/my_menu_drawer.dart';

class MyReportsPage extends StatelessWidget {
  const MyReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyMenuDrawer(),
      
      appBar: AppBar(
        title: const Text("Reports"),
      ),
      body: const Center(
        child: Text(
          "Attendance Reports",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}