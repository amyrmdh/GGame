import 'dart:convert';

import 'dart:convert';

List<GameList> listGameFromJson(String str) =>
    List<GameList>.from(json.decode(str).map((x) => GameList.fromJson(x)));

class GameList {
  GameList({
    this.id,
    this.title,
    this.thumbnail,
    this.shortDescription,
    this.gameUrl,
    this.genre,
    this.platform,
    this.publisher,
    this.developer,
    this.releaseDate,
    this.freetogameProfileUrl,
  });

  int? id;
  String? title;
  String? thumbnail;
  String? shortDescription;
  String? gameUrl;
  String? genre;
  String? platform;
  String? publisher;
  String? developer;
  DateTime? releaseDate;
  String? freetogameProfileUrl;

  factory GameList.fromJson(Map<String, dynamic> json) => GameList(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
        shortDescription: json["short_description"] == null
            ? null
            : json["short_description"],
        gameUrl: json["game_url"] == null ? null : json["game_url"],
        genre: json["genre"] == null ? null : json["genre"],
        platform: json["platform"] == null ? null : json["platform"],
        publisher: json["publisher"] == null ? null : json["publisher"],
        developer: json["developer"] == null ? null : json["developer"],
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        freetogameProfileUrl: json["freetogame_profile_url"] == null
            ? null
            : json["freetogame_profile_url"],
      );
}
