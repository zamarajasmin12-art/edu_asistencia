import 'package:flutter/material.dart';

class MyObservationsPage extends StatelessWidget {
  const MyObservationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Observations"),
      ),
      body: const Center(
        child: Text("Student Observations"),
      ),
    );
  }
}