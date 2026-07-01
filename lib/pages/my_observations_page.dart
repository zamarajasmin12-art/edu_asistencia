import 'package:flutter/material.dart';

class MyObservationsPage extends StatelessWidget {
  const MyObservationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Observaciones")),
      body: const Center(child: Text("Observaciones del Estudiante")),
    );
  }
}
