class Usuario{
  String id;
  final String nome;
  final String email;
  final String telefone;
  final String latitude;
  final String longitude;

  Usuario({
    this.id='',
    required this.nome,
    required this.email,
    required this.telefone,
    required this.latitude,
    required this.longitude
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': nome,
    'email': email,
    'telefone': telefone,
    'latitude': latitude,
    'longitude': longitude
  };

  static Usuario fromJson(Map<String, dynamic> json) => Usuario(
    id: json['id'],
    nome: json['name'],
    email: json['email'],
    latitude: json['latitude'],
    longitude: json['longitude'],
    telefone: json['telefone']
  );

  
}