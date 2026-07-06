import 'package:flutter/material.dart';
import 'package:edu_asistencia/widgets/my_menu_drawer.dart';

class MySettingsPage extends StatefulWidget {
  const MySettingsPage({super.key});

  @override
  State<MySettingsPage> createState() => _MySettingsPageState();
}

class _MySettingsPageState extends State<MySettingsPage> {
  // Opciones de configuración
  final List<Map<String, dynamic>> settingsOptions = [
    {
      'id': 1,
      'title': 'Editar Perfil',
      'description': 'Actualiza tu información personal',
      'icon': Icons.person,
      'color': const Color.fromARGB(255, 71, 107, 139),
    },
    {
      'id': 2,
      'title': 'Cambiar Contraseña',
      'description': 'Modifica tu contraseña de acceso',
      'icon': Icons.lock,
      'color': const Color.fromARGB(255, 136, 147, 151),
    },
    {
      'id': 3,
      'title': 'Notificaciones',
      'description': 'Gestiona alertas y notificaciones',
      'icon': Icons.notifications,
      'color': const Color.fromARGB(255, 255, 193, 7),
    },
    {
      'id': 4,
      'title': 'Sincronización',
      'description': 'Sincroniza datos automáticamente',
      'icon': Icons.sync,
      'color': const Color.fromARGB(255, 82, 233, 76),
    },
  ];

  Widget _buildSettingCard(Map<String, dynamic> option) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              option['color'].withValues(alpha: 0.15),
              option['color'].withValues(alpha: 0.05),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 14,
          ),
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: option['color'].withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(option['icon'], color: option['color'], size: 28),
          ),
          title: Text(
            option['title'],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Color.fromARGB(255, 36, 72, 112),
            ),
          ),
          subtitle: Text(
            option['description'],
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.black38,
          ),
          onTap: () {
            _handleSettingTap(option['title']);
          },
        ),
      ),
    );
  }

  void _handleSettingTap(String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$title - Próximamente'),
        duration: const Duration(milliseconds: 800),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyMenuDrawer(),
      appBar: AppBar(title: const Text("Configuración"), elevation: 0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sección: Cuenta
              const Text(
                'Cuenta',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 36, 72, 112),
                ),
              ),
              const SizedBox(height: 12),
              _buildSettingCard(settingsOptions[0]),
              _buildSettingCard(settingsOptions[1]),
              const SizedBox(height: 24),

              // Sección: Preferencias
              const Text(
                'Preferencias',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 36, 72, 112),
                ),
              ),
              const SizedBox(height: 12),
              _buildSettingCard(settingsOptions[2]),
              _buildSettingCard(settingsOptions[3]),
              const SizedBox(height: 24),

              // Información de la App
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 240, 248, 255),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: const Color.fromARGB(255, 71, 107, 139),
                    width: 1.5,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Acerca de la Aplicación',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Color.fromARGB(255, 36, 72, 112),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Edu Asistencia v1.0',
                      style: TextStyle(fontSize: 12, color: Colors.black87),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '',
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
