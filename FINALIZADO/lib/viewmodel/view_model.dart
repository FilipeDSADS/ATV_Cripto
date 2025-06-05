import 'package:flutter/material.dart';
import '../data/models/cripto.dart';
import '../repository/repository.dart';

class ViewModel extends ChangeNotifier {
  final Repository repository;

  ViewModel(this.repository) {
    fetchCryptos('');
  }

  List<Cripto> criptos = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> fetchCryptos(String simbolosText) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    final defaultSimbolos = [
      'BTC',
      'ETH',
      'SOL',
      'BNB',
      'BCH',
      'MKR',
      'AAVE',
      'DOT',
      'SUI',
      'ADA',
      'XRP',
      'TIA',
      'NEO',
      'NEAR',
      'PENDLE',
      'RENDER',
      'LINK',
      'TON',
      'XAI',
      'SEI',
      'IMX',
      'ETHFI',
      'UMA',
      'SUPER',
      'FET',
      'USUAL',
      'GALA',
      'PAAL',
      'AERO'
    ];

    final simbolos = simbolosText.isEmpty
        ? defaultSimbolos
        : simbolosText.split(',').map((s) => s.trim().toUpperCase()).toList();

    try {
      criptos = await repository.getCryptos(simbolos);
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
