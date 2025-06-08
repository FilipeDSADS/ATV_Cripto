import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/cripto.dart';
import 'exchange_service.dart';

class ApiService {
  final String _baseUrl =
      'https://pro-api.coinmarketcap.com/v2/cryptocurrency/quotes/latest';
  final String _apiKey = 'd7430ca5-8984-434c-8117-1f99aca26ba9';

  final ExchangeService exchangeService;

  ApiService({required this.exchangeService});

  Future<List<Cripto>> fetchCryptos(List<String> symbols) async {
    final uri = Uri.parse("$_baseUrl?symbol=${symbols.join(",")}");
    final response = await http.get(uri, headers: {
      'Accepts': 'application/json',
      'X-CMC_PRO_API_KEY': _apiKey,
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final cryptoMap = data['data'] as Map<String, dynamic>;
      final usdToBrl = await exchangeService.fetchUsdToBrl();

      return cryptoMap.entries.map<Cripto>((entry) {
        final json = entry.value[0];
        final precoUsd = json['quote']['USD']['price'] ?? 0.0;
        final precoBrl = precoUsd * usdToBrl;

        return Cripto(
          nome: json['name'] ?? 'Desconhecido',
          simbolo: json['symbol'] ?? '',
          precoUsd: precoUsd.toDouble(),
          precoBrl: precoBrl,
          dateAdded: json['date_added'] ?? '',
        );
      }).toList();
    } else {
      throw Exception('Erro ao buscar dados da API');
    }
  }
}
