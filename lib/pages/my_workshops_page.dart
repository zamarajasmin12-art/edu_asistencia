import 'package:flutter/material.dart';
import 'package:edu_asistencia/widgets/my_menu_drawer.dart';

class MyWorkshopsPage extends StatelessWidget {
  const MyWorkshopsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyMenuDrawer(),
      
      appBar: AppBar(
        title: const Text("Workshops"),
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.engineering),
            title: Text("Electronics Workshop"),
          ),
          ListTile(
            leading: Icon(Icons.build),
            title: Text("Mechanical Workshop"),
          ),
          ListTile(
            leading: Icon(Icons.computer),
            title: Text("Computer Workshop"),
          ),
        ],
      ),
    );
  }
}