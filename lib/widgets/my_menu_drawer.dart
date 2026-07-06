import 'package:flutter/material.dart';

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
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            // Header mejorado
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 41, 98, 186),
                    Color.fromARGB(255, 66, 133, 244),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: UserAccountsDrawerHeader(
                accountName: const Text(
                  "Docente",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                accountEmail: const Text(
                  "Certus@eduasistencia.com",
                  style: TextStyle(fontSize: 13),
                ),
                currentAccountPicture: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/profile.png',
                        fit: BoxFit.cover,
                        width: 64,
                        height: 64,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 76, 175, 80),
                                  Color.fromARGB(255, 56, 142, 60),
                                ],
                              ),
                            ),
                            child: const Icon(
                              Icons.person_rounded,
                              size: 40,
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Menú items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 12),
                children: [
                  _buildMenuItem(
                    context,
                    icon: Icons.home_rounded,
                    title: "Inicio",
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/home',
                        (route) => false,
                      );
                    },
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.people_rounded,
                    title: "Estudiantes",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const MyStudentsPage(),
                        ),
                      );
                    },
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.school_rounded,
                    title: "Talleres",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const MyWorkshopsPage(),
                        ),
                      );
                    },
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.qr_code_scanner_rounded,
                    title: "Escáner QR",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const MyQrPage()),
                      );
                    },
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.bar_chart_rounded,
                    title: "Reportes",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const MyReportsPage(),
                        ),
                      );
                    },
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.note_alt_rounded,
                    title: "Observaciones",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const MyObservationsPage(),
                        ),
                      );
                    },
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.settings_rounded,
                    title: "Configuración",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const MySettingsPage(),
                        ),
                      );
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Divider(height: 1, thickness: 1),
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.logout_rounded,
                    title: "Cerrar Sesión",
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
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        leading: Icon(
          icon,
          color: const Color.fromARGB(255, 41, 98, 186),
          size: 24,
        ),
        title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
        onTap: onTap,
        hoverColor: Colors.blue.shade50,
      ),
    );
  }
}
