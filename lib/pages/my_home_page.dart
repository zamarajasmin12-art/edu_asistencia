import 'package:flutter/material.dart';

import '../models/my_student.dart';
import '../pages/my_students_page.dart';
import '../widgets/my_menu_drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onBottomNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _smallStatCard(String title, String value) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(color: Colors.black54, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeContent() {
    final totalStudents = MyStudentsPage.students.length;
    final registeredCount = MyStudentsPage.students
        .where((s) => s.status != 'No registrado')
        .length;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: _smallStatCard('Alumnos', '$totalStudents')),
              const SizedBox(width: 12),
              Expanded(
                child: _smallStatCard('Registrados', '$registeredCount'),
              ),
            ],
          ),
          const SizedBox(height: 18),

          // Botón Registrar alumno
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 76, 175, 80),
                  Color.fromARGB(255, 56, 142, 60),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withValues(alpha: 0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: _showAddStudentDialog,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.person_add_rounded,
                        color: Colors.white,
                        size: 26,
                      ),
                      SizedBox(width: 12),
                      Text(
                        'Registrar alumno',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),

          // Botón QR Scanner
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color.fromARGB(255, 67, 109, 172),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: _showQRScannerDemo,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.qr_code_scanner_rounded,
                        color: Color.fromARGB(255, 41, 98, 186),
                        size: 26,
                      ),
                      SizedBox(width: 12),
                      Text(
                        'Escanear QR',
                        style: TextStyle(
                          color: Color.fromARGB(255, 41, 98, 186),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Información/Tip
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.blue.shade200, width: 1),
            ),
            child: Row(
              children: [
                Icon(Icons.info_rounded, color: Colors.blue.shade700, size: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Escanea el código QR para marcar asistencia de forma rápida.',
                    style: TextStyle(
                      color: Colors.blue.shade900,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  void _showAddStudentDialog() {
    final nameController = TextEditingController();
    final codeController = TextEditingController();
    String workshop = 'Activo';

    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Registrar nuevo alumno'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Nombre completo',
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: codeController,
                      decoration: const InputDecoration(
                        labelText: 'Código / N° de lista',
                      ),
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      initialValue: workshop,
                      decoration: const InputDecoration(labelText: 'Taller'),
                      items: const [
                        DropdownMenuItem(
                          value: 'Activo',
                          child: Text('Activo'),
                        ),
                        DropdownMenuItem(
                          value: 'Inactivo',
                          child: Text('Inactivo'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          workshop = value ?? 'Activo';
                        });
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                  },
                  child: const Text('Cancelar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final name = nameController.text.trim();
                    final code = codeController.text.trim();

                    if (name.isEmpty || code.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Ingresa nombre y código para registrar.',
                          ),
                        ),
                      );
                      return;
                    }

                    setState(() {
                      MyStudentsPage.students.add(
                        MyStudent(name: name, code: code, workshop: workshop),
                      );
                    });

                    Navigator.of(dialogContext).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Alumno "$name" agregado correctamente.'),
                      ),
                    );
                  },
                  child: const Text('Guardar'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showQRScannerDemo() {
    // Navegar a la página del escáner QR
    Navigator.of(context).pushNamed('/qr');
  }

  Widget _buildStudentsContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: const [
                Expanded(
                  flex: 4,
                  child: Text(
                    'Nombre',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Código',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
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
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: MyStudentsPage.students.length,
                separatorBuilder: (context, index) =>
                    Divider(height: 0, color: Colors.grey.shade300),
                itemBuilder: (context, index) {
                  final student = MyStudentsPage.students[index];
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
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyMenuDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Edu Asistencia'),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Buscar estudiante',
            onPressed: _showSearchDialog,
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$value seleccionado (demo)')),
              );
            },
            itemBuilder: (context) => const [
              PopupMenuItem(value: 'Perfil', child: Text('Perfil')),
              PopupMenuItem(value: 'Ayuda', child: Text('Ayuda')),
              PopupMenuItem(value: 'Salir', child: Text('Salir')),
            ],
          ),
        ],
      ),
      body: _buildBodyForIndex(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        backgroundColor: const Color.fromARGB(255, 140, 177, 236),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        onTap: _onBottomNavTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Alumnos'),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_turned_in),
            label: 'Asistencia',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Ajustes'),
        ],
      ),
    );
  }

  void _showSearchDialog() {
    String searchQuery = '';

    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            // Filtrar estudiantes en tiempo real
            List<MyStudent> filteredStudents = searchQuery.isEmpty
                ? MyStudentsPage.students
                : MyStudentsPage.students
                      .where(
                        (student) => student.name.toLowerCase().contains(
                          searchQuery.toLowerCase(),
                        ),
                      )
                      .toList();

            return AlertDialog(
              title: const Text('Buscar estudiante'),
              content: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Campo de búsqueda
                    TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: 'Escribe el nombre del alumno...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    // Lista de resultados
                    SizedBox(
                      height: 200,
                      child: filteredStudents.isEmpty
                          ? const Center(
                              child: Text('No se encontraron estudiantes'),
                            )
                          : ListView.builder(
                              itemCount: filteredStudents.length,
                              itemBuilder: (context, index) {
                                final student = filteredStudents[index];
                                return ListTile(
                                  title: Text(student.name),
                                  subtitle: Text(student.code),
                                  trailing: Text(
                                    student.workshop,
                                    style: TextStyle(
                                      color: student.workshop == 'Activo'
                                          ? Colors.green
                                          : Colors.orange,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                  },
                  child: const Text('Cerrar'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildBodyForIndex() {
    switch (_selectedIndex) {
      case 0:
        return _buildHomeContent();
      case 1:
        return _buildStudentsContent();
      case 2:
        return _buildAttendanceContent();
      case 3:
        return _buildSettingsContent();
      default:
        return _buildHomeContent();
    }
  }

  Widget _buildAttendanceContent() {
    final students = MyStudentsPage.students;
    return Column(
      children: [
        const SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: students.length,
            itemBuilder: (context, index) {
              final s = students[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      CircleAvatar(child: const Icon(Icons.person)),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              s.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              s.code,
                              style: const TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      DropdownButton<String>(
                        value: s.status == 'No registrado' ? null : s.status,
                        hint: const Text('Estado'),
                        items: const [
                          DropdownMenuItem(
                            value: 'Presente',
                            child: Text('Presente'),
                          ),
                          DropdownMenuItem(
                            value: 'Tardanza',
                            child: Text('Tardanza'),
                          ),
                          DropdownMenuItem(
                            value: 'Ausente',
                            child: Text('Ausente'),
                          ),
                          DropdownMenuItem(
                            value: 'Justificado',
                            child: Text('Justificado'),
                          ),
                        ],
                        onChanged: (v) {
                          setState(() {
                            s.status = v ?? 'No registrado';
                            if (s.status == 'Presente') {
                              s.attendancePercent = 100;
                            } else if (s.status == 'Tardanza') {
                              s.attendancePercent = 50;
                            } else if (s.status == 'Ausente') {
                              s.attendancePercent = 0;
                            } else if (s.status == 'Justificado') {
                              s.attendancePercent = 100;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsContent() {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        const SizedBox(height: 8),
        const Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text('Editar perfil'),
            subtitle: Text('Nombre, correo y foto'),
          ),
        ),
        const SizedBox(height: 8),
        const Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: ListTile(
            leading: Icon(Icons.lock),
            title: Text('Cambiar contraseña'),
          ),
        ),
        const SizedBox(height: 8),
        const Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notificaciones'),
          ),
        ),
        const SizedBox(height: 8),
        const Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: ListTile(
            leading: Icon(Icons.sync),
            title: Text('Sincronización'),
          ),
        ),
        const SizedBox(height: 14),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: ElevatedButton.icon(
            icon: const Icon(Icons.save),
            label: const Text('Guardar cambios'),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Cambios guardados (demo)')),
              );
            },
          ),
        ),
      ],
    );
  }
}
