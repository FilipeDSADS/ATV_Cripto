import '../data/datasource/api_service.dart';
import '../data/models/cripto.dart';

class Repository {
  final ApiService _apiService;

  Repository(this._apiService);

  Future<List<Cripto>> getCryptos(List<String> simbolos) {
    return _apiService.fetchCryptos(simbolos);
  }
}
