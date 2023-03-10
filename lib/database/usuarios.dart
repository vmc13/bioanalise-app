class Usuario{
  String id;
  final String nome;
  final String email;
  final String cpf;
  final String data;
  final String phone;
  final String convenio;


  Usuario({
    this.id='',
    required this.nome,
    required this.email,
    required this.cpf,
    required this.data,
    required this.phone,
    required this.convenio,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': nome,
    'email': email,
    'cpf': cpf,
    'data_nascimento': data,
    'telefone': phone,
    'convenio': convenio
  };

  static Usuario fromJson(Map<String, dynamic> json) => Usuario(
    id: json['id'],
    nome: json['name'],
    email: json['email'],
    cpf: json['cpf'],
    data: json['data_nascimento'],
    phone: json['telefone'],
    convenio: json['convenio'],
  );

  
}