class ApiService {

  Map<String, String> apiMap;

  ApiService() {
    this.apiMap = new Map<String, String>();
    this.apiMap['pokemon'] = 'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
  }

  getApi({String apiName}) {
    return this.apiMap[apiName];
  }
}