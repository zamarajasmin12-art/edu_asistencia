import 'package:flutter/material.dart';
import 'package:edu_asistencia/pages/my_students_page.dart';

class MyObservationsPage extends StatefulWidget {
  const MyObservationsPage({super.key});

  @override
  State<MyObservationsPage> createState() => _MyObservationsPageState();
}

class _MyObservationsPageState extends State<MyObservationsPage> {
  final List<_Observation> _observations = [
    const _Observation(
      date: '12/05/2026',
      student: 'Ana Sofía Pérez',
      teacher: 'Prof. García',
      note: 'Participación activa en clase y excelente trabajo en equipo.',
    ),
    const _Observation(
      date: '14/05/2026',
      student: 'Diego González',
      teacher: 'Prof. Ramírez',
      note: 'Entregó incompleto, necesita reforzar lectura de instrucciones.',
    ),
    const _Observation(
      date: '16/05/2026',
      student: 'Camila Rodríguez',
      teacher: 'Prof. Castillo',
      note: 'Mostró actitud colaborativa y mejoró su puntualidad.',
    ),
  ];

  void _showAddObservationDialog() {
    String selectedStudent = MyStudentsPage.students.isNotEmpty
        ? MyStudentsPage.students.first.name
        : '';
    final teacherController = TextEditingController();
    final noteController = TextEditingController();

    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          title: const Text('Agregar observación'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<String>(
                  initialValue: selectedStudent.isEmpty
                      ? null
                      : selectedStudent,
                  decoration: const InputDecoration(labelText: 'Alumno'),
                  items: MyStudentsPage.students
                      .map(
                        (student) => DropdownMenuItem(
                          value: student.name,
                          child: Text(student.name),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      selectedStudent = value;
                    }
                  },
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: teacherController,
                  decoration: const InputDecoration(labelText: 'Docente'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: noteController,
                  decoration: const InputDecoration(labelText: 'Observación'),
                  minLines: 3,
                  maxLines: 5,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                final teacher = teacherController.text.trim();
                final note = noteController.text.trim();

                if (selectedStudent.isEmpty ||
                    teacher.isEmpty ||
                    note.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Completa todos los campos para agregar la observación.',
                      ),
                    ),
                  );
                  return;
                }

                setState(() {
                  _observations.insert(
                    0,
                    _Observation(
                      date: _formattedDate(DateTime.now()),
                      student: selectedStudent,
                      teacher: teacher,
                      note: note,
                    ),
                  );
                });

                Navigator.of(dialogContext).pop();
              },
              child: const Text('Agregar'),
            ),
          ],
        );
      },
    );
  }

  String _formattedDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Observaciones')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Registro de observaciones educativas',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 1,
                child: _observations.isEmpty
                    ? const Center(
                        child: Padding(
                          padding: EdgeInsets.all(24),
                          child: Text(
                            'No hay observaciones todavía. Usa el botón + para registrar una nueva nota pedagógica.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.4,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      )
                    : ListView.separated(
                        padding: EdgeInsets.zero,
                        itemCount: _observations.length,
                        separatorBuilder: (context, index) =>
                            Divider(height: 0, color: Colors.grey.shade300),
                        itemBuilder: (context, index) {
                          final observation = _observations[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 16,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        observation.student,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        observation.date,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 13.4,
                                          color: Colors.grey.shade700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  observation.note,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade800,
                                    height: 1.4,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.person_outline,
                                      size: 16,
                                      color: Colors.black54,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      observation.teacher,
                                      style: TextStyle(
                                        fontSize: 13.4,
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: MyStudentsPage.students.isEmpty
            ? null
            : _showAddObservationDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _Observation {
  final String date;
  final String student;
  final String teacher;
  final String note;

  const _Observation({
    required this.date,
    required this.student,
    required this.teacher,
    required this.note,
  });
}
