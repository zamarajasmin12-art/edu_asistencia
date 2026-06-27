import 'package:flutter/material.dart';

import '../widgets/my_dashboard_card.dart';
import '../widgets/my_menu_drawer.dart';

import 'my_students_page.dart';
import 'my_workshops_page.dart';
import 'my_reports_page.dart';
import 'my_observations_page.dart';
import 'my_settings_page.dart';
import 'my_qr_page.dart';
import 'my_profile_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, dynamic>> _items = [
    {
      'title': 'Registrar\nAsistencia',
      'icon': Icons.qr_code_scanner,
      'color': Colors.green,
      'page': const MyQrPage(),
    },
    {
      'title': 'Estudiantes',
      'icon': Icons.people,
      'color': Colors.blue,
      'page': const MyStudentsPage(),
    },
    {
      'title': 'Talleres',
      'icon': Icons.engineering,
      'color': Colors.orange,
      'page': const MyWorkshopsPage(),
    },
    {
      'title': 'Reportes',
      'icon': Icons.bar_chart,
      'color': Colors.purple,
      'page': const MyReportsPage(),
    },
    {
      'title': 'Observaciones',
      'icon': Icons.note_alt,
      'color': Colors.red,
      'page': const MyObservationsPage(),
    },
    {
      'title': 'Configuración',
      'icon': Icons.settings,
      'color': Colors.grey,
      'page': const MySettingsPage(),
    },
  ];

  late List<Map<String, dynamic>> _filteredItems;

  @override
  void initState() {
    super.initState();
    _filteredItems = List.from(_items);
  }

  void _filter(String query) {
    final q = query.toLowerCase();
    setState(() {
      if (q.isEmpty) {
        _filteredItems = List.from(_items);
      } else {
        _filteredItems = _items
            .where(
              (item) => (item['title'] as String).toLowerCase().contains(q),
            )
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyMenuDrawer(),
      appBar: AppBar(
        elevation: 0,
        // Buscador más compacto en el AppBar.
        title: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 340),
          child: SizedBox(
            height: 32,
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 10,
                ),
                prefixIcon: const Icon(Icons.search, size: 20),
                hintText: 'Buscar...',
                hintStyle: const TextStyle(fontSize: 14),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: _filter,
            ),
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'Notificaciones',
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MyProfilePage()),
                );
              },
              child: const CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.black, size: 18),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),

            LayoutBuilder(
              builder: (context, constraints) {
                final columns = constraints.maxWidth >= 900
                    ? 3
                    : constraints.maxWidth >= 600
                    ? 2
                    : 2;

                return GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: columns,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1,
                  children: _filteredItems.map((item) {
                    return MyDashboardCard(
                      title: item['title'] as String,
                      icon: item['icon'] as IconData,
                      color: item['color'] as Color,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => item['page'] as Widget,
                          ),
                        );
                      },
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
