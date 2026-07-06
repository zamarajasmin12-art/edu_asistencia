import 'package:flutter/material.dart';
import 'package:edu_asistencia/pages/my_students_page.dart';
import 'package:edu_asistencia/widgets/my_menu_drawer.dart';

class MyWorkshopsPage extends StatefulWidget {
  const MyWorkshopsPage({super.key});

  @override
  State<MyWorkshopsPage> createState() => _MyWorkshopsPageState();
}

class _MyWorkshopsPageState extends State<MyWorkshopsPage> {
  final List<Map<String, dynamic>> workshops = [
    {
      'id': 1,
      'name': 'Deportes',
      'icon': Icons.sports_soccer,
      'color': Color.fromARGB(255, 31, 97, 152),
      'description': 'Actividades físicas y deportivas',
    },
    {
      'id': 2,
      'name': 'Arte y Cultura',
      'icon': Icons.palette,
      'color': Color.fromARGB(255, 47, 117, 183),
      'description': 'Expresión artística y cultural',
    },
    {
      'id': 3,
      'name': 'Idiomas y Habilidades',
      'icon': Icons.language,
      'color': Color.fromARGB(255, 57, 112, 184),
      'description': 'Aprendizaje de idiomas y competencias',
    },
  ];

  void _showAddWorkshopDialog() {
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();

    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Agregar Taller'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Nombre del taller',
                  hintText: 'Ej. Ciencias',
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Descripción',
                  hintText: 'Ej. Actividades científicas',
                ),
                minLines: 1,
                maxLines: 3,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text.trim();
                final description = descriptionController.text.trim();
                if (name.isEmpty) {
                  return;
                }

                setState(() {
                  workshops.add({
                    'id': workshops.length + 1,
                    'name': name,
                    'icon': Icons.school,
                    'color': const Color.fromARGB(255, 100, 149, 237),
                    'description': description.isEmpty
                        ? 'Nuevo taller educativo'
                        : description,
                  });
                });
                Navigator.of(context).pop();
              },
              child: const Text('Agregar'),
            ),
          ],
        );
      },
    );
  }

  int _countStudentsByWorkshop(String workshopName) {
    return MyStudentsPage.students
        .where((s) => s.workshop == workshopName)
        .length;
  }

  Widget _buildWorkshopCard(
    BuildContext context,
    Map<String, dynamic> workshop,
  ) {
    final studentCount = _countStudentsByWorkshop(workshop['name']);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            (workshop['color'] as Color).withValues(alpha: 0.85),
            (workshop['color'] as Color).withValues(alpha: 0.5),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: (workshop['color'] as Color).withValues(alpha: 0.35),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => _showWorkshopDetails(context, workshop, studentCount),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.25),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(
                        workshop['icon'],
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            workshop['name'],
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '$studentCount estudiantes',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white.withValues(alpha: 0.6),
                      size: 24,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  workshop['description'],
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Colors.white70,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showWorkshopDetails(
    BuildContext context,
    Map<String, dynamic> workshop,
    int studentCount,
  ) {
    final studentsInWorkshop = MyStudentsPage.students
        .where((s) => s.workshop == workshop['name'])
        .toList();

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: (workshop['color'] as Color).withValues(
                        alpha: 0.2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      workshop['icon'],
                      color: workshop['color'],
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          workshop['name'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '$studentCount estudiantes activos',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Estudiantes del Taller',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: studentsInWorkshop.isEmpty
                    ? const Center(
                        child: Text('No hay estudiantes en este taller'),
                      )
                    : ListView.builder(
                        itemCount: studentsInWorkshop.length,
                        itemBuilder: (context, index) {
                          final student = studentsInWorkshop[index];
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: workshop['color'],
                              child: Text(
                                student.name[0].toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            title: Text(student.name),
                            subtitle: Text(student.code),
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyMenuDrawer(),
      appBar: AppBar(title: const Text('Talleres'), elevation: 0),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: workshops.length,
                itemBuilder: (context, index) {
                  return _buildWorkshopCard(context, workshops[index]);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddWorkshopDialog,
        backgroundColor: const Color.fromARGB(255, 86, 119, 165),
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}
