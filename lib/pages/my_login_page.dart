import 'package:flutter/material.dart';
import 'package:edu_asistencia/pages/my_home_page.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLoginPage> {
  final usuarioController = TextEditingController();
  final passwordController = TextEditingController();

  String rol = "Docente";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Icon(Icons.school, size: 90, color: Colors.blue),

                const SizedBox(height: 20),

                const Text(
                  "EDU-ASISTENCIA",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 30),

                TextField(
                  controller: usuarioController,
                  decoration: const InputDecoration(
                    labelText: "Usuario",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Contraseña",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                DropdownButtonFormField<String>(
                  initialValue: rol,
                  items: const [
                    DropdownMenuItem(value: "Docente", child: Text("Docente")),
                    DropdownMenuItem(
                      value: "Estudiante",
                      child: Text("Estudiante"),
                    ),
                    DropdownMenuItem(
                      value: "Coordinador",
                      child: Text("Coordinador"),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      rol = value!;
                    });
                  },
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const MyHomePage()),
                    );
                  },
                  child: const Text("Ingresar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
