import 'package:flutter/material.dart';

class MyStudentCard extends StatelessWidget {
  final String name;
  final String code;
  final String workshop;
  final double attendance;

  const MyStudentCard({
    super.key,
    required this.name,
    required this.code,
    required this.workshop,
    required this.attendance,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: Text(name),
              subtitle: Text(code),
            ),

            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(value: attendance / 100),
                ),
                const SizedBox(width: 10),
                Text("${attendance.toInt()}%"),
              ],
            ),

            const SizedBox(height: 10),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(workshop, style: const TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }
}
