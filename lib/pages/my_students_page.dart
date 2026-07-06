import 'package:flutter/material.dart';
import 'package:edu_asistencia/models/my_student.dart';

class MyStudentsPage extends StatelessWidget {
  const MyStudentsPage({super.key});

  static List<MyStudent> students = [
    MyStudent(
      name: 'Ana Sofía Pérez',
      code: '1°A · No. 01',
      workshop: 'Activo',
    ),
    MyStudent(name: 'Bruno Martínez', code: '1°A · No. 02', workshop: 'Activo'),
    MyStudent(
      name: 'Camila Rodríguez',
      code: '1°A · No. 03',
      workshop: 'Activo',
    ),
    MyStudent(
      name: 'Diego González',
      code: '1°A · No. 04',
      workshop: 'Inactivo',
    ),
    MyStudent(name: 'Elena Ramírez', code: '1°A · No. 05', workshop: 'Activo'),
    MyStudent(name: 'Fernando López', code: '1°A · No. 06', workshop: 'Activo'),
    MyStudent(
      name: 'Gabriela Torres',
      code: '1°A · No. 07',
      workshop: 'Activo',
    ),
    MyStudent(name: 'Ismael Ruiz', code: '1°A · No. 08', workshop: 'Inactivo'),
    MyStudent(
      name: 'Julieta Morales',
      code: '1°A · No. 09',
      workshop: 'Activo',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Estudiantes"), elevation: 2),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          children: [
            // Header de tabla
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 41, 98, 186),
                    Color.fromARGB(255, 66, 133, 244),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      'Nombre',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Código',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Estado',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Lista de estudiantes
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: students.length,
                    separatorBuilder: (context, index) =>
                        Divider(height: 0, color: Colors.grey.shade300),
                    itemBuilder: (context, index) {
                      final student = students[index];
                      final isActive = student.workshop == 'Activo';

                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 16,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text(
                                student.name,
                                style: const TextStyle(
                                  fontSize: 14.6,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                student.code,
                                style: TextStyle(
                                  fontSize: 13.6,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                student.workshop,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 13.6,
                                  fontWeight: FontWeight.w600,
                                  color: isActive
                                      ? Colors.green.shade800
                                      : Colors.orange.shade800,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/qr');
        },
        child: const Icon(Icons.qr_code_scanner),
      ),
    );
  }
}
