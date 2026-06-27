import 'package:flutter/material.dart';
import 'package:edu_asistencia/widgets/my_menu_drawer.dart';

class MySettingsPage extends StatelessWidget {
  const MySettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyMenuDrawer(),

      appBar: AppBar(title: const Text("Configuración")),
      body: ListView(
        children: const [
          ListTile(leading: Icon(Icons.person), title: Text("Editar Perfil")),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text("Cambiar Contraseña"),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Notificaciones"),
          ),
          ListTile(leading: Icon(Icons.sync), title: Text("Sincronización")),
        ],
      ),
    );
  }
}
