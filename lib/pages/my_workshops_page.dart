import 'package:flutter/material.dart';

class MyWorkshopsPage extends StatelessWidget {
  const MyWorkshopsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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