import 'package:flutter/material.dart';
import 'package:edu_asistencia/widgets/my_menu_drawer.dart';

class MySettingsPage extends StatelessWidget {
  const MySettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyMenuDrawer(),
      
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(
        children: const [
          ListTile(leading: Icon(Icons.person), title: Text("Edit Profile")),
          ListTile(leading: Icon(Icons.lock), title: Text("Change Password")),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Notifications"),
          ),
          ListTile(leading: Icon(Icons.sync), title: Text("Synchronization")),
        ],
      ),
    );
  }
}
