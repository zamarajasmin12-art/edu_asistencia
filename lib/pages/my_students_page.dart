import 'package:flutter/material.dart';
import 'package:edu_asistencia/widgets/my_menu_drawer.dart';
import 'package:edu_asistencia/models/my_student.dart';

class MyStudentsPage extends StatelessWidget {
  const MyStudentsPage({super.key});

  static final List<MyStudent> students = [
    MyStudent(
      name: 'Ana Sofía Pérez',
      code: '4°A · No. 01',
      workshop: 'Activo',
    ),
    MyStudent(name: 'Bruno Martínez', code: '4°A · No. 02', workshop: 'Activo'),
    MyStudent(
      name: 'Camila Rodríguez',
      code: '4°A · No. 03',
      workshop: 'Activo',
    ),
    MyStudent(
      name: 'Diego González',
      code: '4°A · No. 04',
      workshop: 'Inactivo',
    ),
    MyStudent(name: 'Elena Ramírez', code: '4°A · No. 05', workshop: 'Activo'),
    MyStudent(name: 'Fernando López', code: '4°A · No. 06', workshop: 'Activo'),
    MyStudent(
      name: 'Gabriela Torres',
      code: '4°A · No. 07',
      workshop: 'Activo',
    ),
    MyStudent(name: 'Ismael Ruiz', code: '4°A · No. 08', workshop: 'Inactivo'),
    MyStudent(
      name: 'Julieta Morales',
      code: '4°A · No. 09',
      workshop: 'Activo',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyMenuDrawer(),
      appBar: AppBar(title: const Text('Estudiantes')),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 12),
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          final isActive = student.workshop == 'Activo';

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              leading: CircleAvatar(
                radius: 24,
                backgroundColor: isActive
                    ? Colors.green.shade100
                    : Colors.orange.shade100,
                child: Icon(
                  Icons.person,
                  color: isActive
                      ? Colors.green.shade700
                      : Colors.orange.shade700,
                ),
              ),
              title: Text(
                student.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(student.code),
              trailing: Chip(
                backgroundColor: isActive
                    ? Colors.green.shade50
                    : Colors.orange.shade50,
                label: Text(
                  student.workshop,
                  style: TextStyle(
                    color: isActive
                        ? Colors.green.shade800
                        : Colors.orange.shade800,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
