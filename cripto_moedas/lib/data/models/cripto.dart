import 'package:intl/intl.dart';

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

  // Agora o fromJson recebe a cotação do dólar (usdToBrlRate)
  factory Cripto.fromJson(Map<String, dynamic> json, double usdToBrlRate) {
    final quote = json['quote'] ?? {};
    final precoUsd = (quote['USD']?['price'] ?? 0).toDouble();
    final precoBrl = precoUsd * usdToBrlRate;

    return Cripto(
      nome: json['name'] ?? 'Sem nome',
      simbolo: json['symbol'] ?? '---',
      precoUsd: precoUsd,
      precoBrl: precoBrl,
      dateAdded: json['date_added'] ?? '---',
    );
  }

  String get precoBrlFormatado =>
      NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(precoBrl);

  String get precoUsdFormatado =>
      NumberFormat.currency(locale: 'en_US', symbol: 'US\$').format(precoUsd);
}
