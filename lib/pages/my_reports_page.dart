import 'package:flutter/material.dart';
import 'package:edu_asistencia/widgets/my_menu_drawer.dart';
import 'package:edu_asistencia/pages/my_students_page.dart';

class MyReportsPage extends StatelessWidget {
  const MyReportsPage({super.key});

  // Calcular estadísticas de asistencia
  Map<String, dynamic> _calculateStats() {
    final students = MyStudentsPage.students;
    final totalStudents = students.length;
    final activeStudents = students.where((s) => s.workshop == 'Activo').length;
    final attendancePercentage = totalStudents > 0
        ? ((activeStudents / totalStudents) * 100).toStringAsFixed(1)
        : '0.0';

    return {
      'totalStudents': totalStudents,
      'activeStudents': activeStudents,
      'attendancePercentage': attendancePercentage,
    };
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              color.withValues(alpha: 0.8),
              color.withValues(alpha: 0.5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.3),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, size: 32, color: Colors.white),
            ),
            const SizedBox(height: 14),
            Text(
              value,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white70,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportOption(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Color color,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('$title (demo)'),
                duration: const Duration(seconds: 2),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: color, size: 26),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.grey.shade400,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final stats = _calculateStats();

    return Scaffold(
      drawer: const MyMenuDrawer(),
      appBar: AppBar(title: const Text("Reportes"), elevation: 0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tarjetas de estadísticas
              Row(
                children: [
                  _buildStatCard(
                    'Total Alumnos',
                    stats['totalStudents'].toString(),
                    Icons.people,
                    const Color.fromARGB(255, 82, 233, 76),
                  ),
                  const SizedBox(width: 12),
                  _buildStatCard(
                    'Activos',
                    stats['activeStudents'].toString(),
                    Icons.check_circle,
                    const Color.fromARGB(255, 71, 107, 139),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _buildStatCard(
                    'Asistencia',
                    '${stats['attendancePercentage']}%',
                    Icons.trending_up,
                    const Color.fromARGB(255, 255, 193, 7),
                  ),
                  const SizedBox(width: 12),
                  _buildStatCard(
                    'Reportes',
                    '3',
                    Icons.description,
                    const Color.fromARGB(255, 244, 67, 54),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Sección de reportes disponibles
              const Text(
                'Reportes Disponibles',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 36, 72, 112),
                ),
              ),
              const SizedBox(height: 16),

              // Opciones de reportes
              _buildReportOption(
                context,
                'Por Estudiante',
                'Detalle de asistencia individual',
                Icons.person_search,
                const Color.fromARGB(255, 71, 107, 139),
              ),
              _buildReportOption(
                context,
                'Por Taller',
                'Asistencia por sesión o taller',
                Icons.groups,
                const Color.fromARGB(255, 82, 233, 76),
              ),
              _buildReportOption(
                context,
                'Por Fechas',
                'Rango de fechas personalizadas',
                Icons.calendar_today,
                const Color.fromARGB(255, 255, 193, 7),
              ),
              _buildReportOption(
                context,
                'Exportar Datos',
                'Descargar reportes en CSV o PDF',
                Icons.download,
                const Color.fromARGB(255, 244, 67, 54),
              ),
              const SizedBox(height: 24),

              // Información educativa
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
                child: Row(
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: Color.fromARGB(255, 71, 107, 139),
                      size: 28,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Seguimiento de Asistencia',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color.fromARGB(255, 36, 72, 112),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Los reportes te ayudan a identificar patrones de asistencia y tomar decisiones informadas.',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
