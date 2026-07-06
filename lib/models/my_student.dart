class MyStudent {
  int? id;
  String name;
  String code;
  String workshop;
  String status; // 'No registrado', 'Presente', 'Ausente', etc.
  double attendancePercent;

  MyStudent({
    this.id,
    required this.name,
    required this.code,
    required this.workshop,
    this.status = 'No registrado',
    this.attendancePercent = 0.0,
  });
}
