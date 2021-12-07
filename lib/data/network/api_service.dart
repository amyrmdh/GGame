import 'package:ggame_project/entity/game.dart';

import 'package:http/http.dart' as http;

class ApiService {
  static ApiService _instance;
  static const baseUrl = 'https://www.freetogame.com/api/';

  factory ApiService() => _instance ?? ApiService._internal();

  ApiService._internal() {
    _instance = this;
  }

  Future<Game> getDetailGame(int id) async {
    Uri url = Uri.parse("${baseUrl}game?id=$id");
    final response = await http.get(url);

    return response.statusCode == 200
        ? gameFromJson(response.body)
        : throw Exception('Failed to load detail game');
  }
}
