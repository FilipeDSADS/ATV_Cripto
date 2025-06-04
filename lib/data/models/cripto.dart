class Cripto {
  final String nome;
  final String simbolo;
  final double precoUsd;
  final double precoBrl;
  final String dateAdded;

  Cripto({
    required this.nome,
    required this.simbolo,
    required this.precoUsd,
    required this.precoBrl,
    required this.dateAdded,
  });

  factory Cripto.fromJson(Map<String, dynamic> json) {
    final quote = json['quote'];
    return Cripto(
      nome: json['nome'],
      simbolo: json['simbolo'],
      precoUsd: quote['USD']?['preco']?.toDouble() ?? 0.0,
      precoBrl: quote['BRL']?['preco']?.toDouble() ?? 0.0,
      dateAdded: json['date_added'],
    );
  }
}
