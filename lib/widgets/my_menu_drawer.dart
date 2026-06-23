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
            accountName: Text("Administrador"),
            accountEmail: Text("admin@eduasistencia.com"),
            currentAccountPicture: CircleAvatar(
              child: Icon(
                Icons.person,
                size: 40,
              ),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Dashboard"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MyHomePage(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.people),
            title: const Text("Students"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MyStudentsPage(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.engineering),
            title: const Text("Workshops"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MyWorkshopsPage(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.qr_code_scanner),
            title: const Text("QR Scanner"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MyQrPage(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.bar_chart),
            title: const Text("Reports"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MyReportsPage(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.note_alt),
            title: const Text("Observations"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MyObservationsPage(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MySettingsPage(),
                ),
              );
            },
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => const MyLoginPage(),
                ),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}