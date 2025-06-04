import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/cripto.dart';

class ApiService {
  final String _baseUrl =
      'https://pro-api.coinmarketcap.com/v2/cryptocurrency/quotes/latest';
  final String _apiKey = 'd7430ca5-8984-434c-8117-1f99aca26ba9';

  Future<List<Cripto>> fetchCryptos(List<String> symbols) async {
    final uri = Uri.parse("$_baseUrl?symbol=${symbols.join(",")}");
    final response = await http.get(uri, headers: {
      'Accepts': 'application/json',
      'X-CMC_PRO_API_KEY': _apiKey,
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final cryptoMap = data['data'] as Map<String, dynamic>;
      return cryptoMap.values.map((json) => Cripto.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao buscar dados da API');
    }
  }
}
