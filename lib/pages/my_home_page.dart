import 'package:flutter/material.dart';

import 'package:edu_asistencia/pages/my_students_page.dart';
import 'package:edu_asistencia/pages/my_workshops_page.dart';
import 'package:edu_asistencia/pages/my_reports_page.dart';
import 'package:edu_asistencia/pages/my_observations_page.dart';
import 'package:edu_asistencia/pages/my_settings_page.dart';
import 'package:edu_asistencia/pages/my_qr_page.dart';

import 'package:edu_asistencia/widgets/my_dashboard_card.dart';
import 'package:edu_asistencia/widgets/my_menu_drawer.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyMenuDrawer(),

      appBar: AppBar(title: const Text("Edu-Asistencia")),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,

          children: [
            MyDashboardCard(
              title: "QR Scanner",
              icon: Icons.qr_code_scanner,
              color: Colors.green,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MyQrPage()),
                );
              },
            ),

            MyDashboardCard(
              title: "Students",
              icon: Icons.people,
              color: Colors.blue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MyStudentsPage()),
                );
              },
            ),

            MyDashboardCard(
              title: "Workshops",
              icon: Icons.engineering,
              color: Colors.orange,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MyWorkshopsPage()),
                );
              },
            ),

            MyDashboardCard(
              title: "Reports",
              icon: Icons.bar_chart,
              color: Colors.purple,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MyReportsPage()),
                );
              },
            ),

            MyDashboardCard(
              title: "Observations",
              icon: Icons.note_alt,
              color: Colors.red,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MyObservationsPage()),
                );
              },
            ),

            MyDashboardCard(
              title: "Settings",
              icon: Icons.settings,
              color: Colors.grey,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MySettingsPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
