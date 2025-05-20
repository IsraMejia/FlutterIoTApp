class IotDeviceModel {
  final int id;
  final String nombre;
  final bool estado;
  final String tipo;

  IotDeviceModel({
    required this.id,
    required this.nombre,
    required this.estado,
    required this.tipo,
  });

  factory IotDeviceModel.fromJson(Map<String, dynamic> json) {
    return IotDeviceModel(
      id: json['id'],
      nombre: json['nombre'],
      estado: json['estado'],
      tipo: json['tipo'],
    );
  }
}
