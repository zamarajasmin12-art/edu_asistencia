import 'package:flutter/material.dart';
import 'package:edu_asistencia/widgets/my_menu_drawer.dart';

class MyQrPage extends StatelessWidget {
  const MyQrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyMenuDrawer(),

      appBar: AppBar(
        title: const Text("QR Scanner"),
      ),
      body: const Center(
        child: Icon(
          Icons.qr_code_scanner,
          size: 150,
        ),
      ),
    );
  }
}