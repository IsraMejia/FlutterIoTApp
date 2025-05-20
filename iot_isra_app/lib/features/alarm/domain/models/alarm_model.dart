class AlarmModel {
  final int id;
  final String hora;
  final bool activa;

  AlarmModel({
    required this.id,
    required this.hora,
    required this.activa,
  });

  factory AlarmModel.fromJson(Map<String, dynamic> json) {
    return AlarmModel(
      id: json['id'],
      hora: json['hora'],
      activa: json['activa'],
    );
  }
}
