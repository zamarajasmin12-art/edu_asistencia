import 'package:flutter/material.dart';

import 'package:edu_asistencia/pages/my_home_page.dart';
import 'package:edu_asistencia/pages/my_students_page.dart';
import 'package:edu_asistencia/pages/my_workshops_page.dart';
import 'package:edu_asistencia/pages/my_qr_page.dart';
import 'package:edu_asistencia/pages/my_reports_page.dart';
import 'package:edu_asistencia/pages/my_observations_page.dart';
import 'package:edu_asistencia/pages/my_settings_page.dart';
import 'package:edu_asistencia/pages/my_login_page.dart';

class MyMenuDrawer extends StatelessWidget {
  const MyMenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Docente"),
            accountEmail: Text("Certus@eduasistencia.com"),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person, size: 40),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Inicio"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MyHomePage()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.people),
            title: const Text("Estudiantes"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MyStudentsPage()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.engineering),
            title: const Text("Talleres"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MyWorkshopsPage()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.qr_code_scanner),
            title: const Text("Escáner QR"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MyQrPage()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.bar_chart),
            title: const Text("Reportes"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MyReportsPage()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.note_alt),
            title: const Text("Observaciones"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MyObservationsPage()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Configuración"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MySettingsPage()),
              );
            },
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Cerrar Sesión"),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const MyLoginPage()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
