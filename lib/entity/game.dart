import 'dart:convert';

import 'package:intl/intl.dart';

import 'favorite.dart';
import 'min_system.dart';
import 'screenshots.dart';

Game gameFromJson(String str) => Game.fromJson(json.decode(str));

List<Game> listGameFromJson(String str) =>
    List<Game>.from(json.decode(str).map((x) => Game.fromJson(x)));

class Game {
  int id;
  String? title;
  String? thumbnail;
  String? status;
  String? shortDescription;
  String? description;
  String? gameUrl;
  String? genre;
  String? platform;
  String? publisher;
  String? developer;
  DateTime? releaseDate;
  String? freetogameProfileUrl;
  MinimumSystemRequirements? minimumSystemRequirements;
  List<Screenshot>? screenshots;

  Game({
    required this.id,
    this.title,
    this.thumbnail,
    this.status,
    this.shortDescription,
    this.description,
    this.gameUrl,
    this.genre,
    this.platform,
    this.publisher,
    this.developer,
    this.releaseDate,
    this.freetogameProfileUrl,
    this.minimumSystemRequirements,
    this.screenshots,
  });

  factory Game.fromJson(Map<String, dynamic> json) => Game(
        id: json["id"],
        title: json["title"],
        thumbnail: json["thumbnail"],
        status: json["status"],
        shortDescription: json["short_description"],
        description: json["description"],
        gameUrl: json["game_url"],
        genre: json["genre"],
        platform: json["platform"],
        publisher: json["publisher"],
        developer: json["developer"],
        releaseDate: DateTime.parse(json["release_date"]),
        freetogameProfileUrl: json["freetogame_profile_url"],
        minimumSystemRequirements: json["minimum_system_requirements"] != null
            ? MinimumSystemRequirements.fromJson(
                json["minimum_system_requirements"])
            : MinimumSystemRequirements(),
        screenshots: json["screenshots"] != null
            ? List<Screenshot>.from(
                json["screenshots"].map((x) => Screenshot.fromJson(x)))
            : List.empty(),
      );

  String toReleaseDate({String? format}) =>
      DateFormat(format ?? 'MMMM yyyy').format(releaseDate!);

  Favorite toFavorite() => Favorite(gameId: id, title: title, thumbnail: thumbnail);    

  @override
  String toString() {
    return """
    Id = $id
    Title = $title
    Url = $gameUrl
    """;
  }
}
