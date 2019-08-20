import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex_flutter/core/config/api_service.dart';

class PokemonService {
  ApiService apiService;

  PokemonService() {
    this.apiService = new ApiService();
  }

  getPokemons() async {
    final url = this.apiService.getApi(apiName: 'pokemon');
    final result = await http.get(url);
    return jsonDecode(result.body);
  }
}