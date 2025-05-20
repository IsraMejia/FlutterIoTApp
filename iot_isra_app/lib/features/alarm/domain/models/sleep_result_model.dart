class SleepResultModel {
  final int duracionMin;
  final int ciclos;

  SleepResultModel({
    required this.duracionMin,
    required this.ciclos,
  });

  factory SleepResultModel.fromJson(Map<String, dynamic> json) {
    return SleepResultModel(
      duracionMin: json['duracion_min'],
      ciclos: json['ciclos'],
    );
  }
}
