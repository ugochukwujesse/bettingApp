// To parse this JSON data, do
//
//     final bestPlayerResponseModel = bestPlayerResponseModelFromJson(jsonString);

import 'dart:convert';

BestPlayerResponseModel bestPlayerResponseModelFromJson(String str) =>
    BestPlayerResponseModel.fromJson(json.decode(str));

String bestPlayerResponseModelToJson(BestPlayerResponseModel data) =>
    json.encode(data.toJson());

class BestPlayerResponseModel {
  bool success;
  Data data;

  BestPlayerResponseModel({
    required this.success,
    required this.data,
  });

  factory BestPlayerResponseModel.fromJson(Map<String, dynamic> json) =>
      BestPlayerResponseModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };
}

class Data {
  BestTeamPlayer bestHomeTeamPlayer;
  BestTeamPlayer bestAwayTeamPlayer;

  Data({
    required this.bestHomeTeamPlayer,
    required this.bestAwayTeamPlayer,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        bestHomeTeamPlayer: BestTeamPlayer.fromJson(json["bestHomeTeamPlayer"]),
        bestAwayTeamPlayer: BestTeamPlayer.fromJson(json["bestAwayTeamPlayer"]),
      );

  Map<String, dynamic> toJson() => {
        "bestHomeTeamPlayer": bestHomeTeamPlayer.toJson(),
        "bestAwayTeamPlayer": bestAwayTeamPlayer.toJson(),
      };
}

class BestTeamPlayer {
  String value;
  String label;
  Player player;

  BestTeamPlayer({
    required this.value,
    required this.label,
    required this.player,
  });

  factory BestTeamPlayer.fromJson(Map<String, dynamic> json) => BestTeamPlayer(
        value: json["value"],
        label: json["label"],
        player: Player.fromJson(json["player"]),
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "label": label,
        "player": player.toJson(),
      };
}

class Player {
  String name;
  String slug;
  String shortName;
  String position;
  String jerseyNumber;
  int height;
  int userCount;
  int id;
  String marketValueCurrency;
  int dateOfBirthTimestamp;
  ProposedMarketValueRaw proposedMarketValueRaw;
  FieldTranslations fieldTranslations;

  Player({
    required this.name,
    required this.slug,
    required this.shortName,
    required this.position,
    required this.jerseyNumber,
    required this.height,
    required this.userCount,
    required this.id,
    required this.marketValueCurrency,
    required this.dateOfBirthTimestamp,
    required this.proposedMarketValueRaw,
    required this.fieldTranslations,
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        name: json["name"],
        slug: json["slug"],
        shortName: json["shortName"],
        position: json["position"],
        jerseyNumber: json["jerseyNumber"],
        height: json["height"],
        userCount: json["userCount"],
        id: json["id"],
        marketValueCurrency: json["marketValueCurrency"],
        dateOfBirthTimestamp: json["dateOfBirthTimestamp"],
        proposedMarketValueRaw:
            ProposedMarketValueRaw.fromJson(json["proposedMarketValueRaw"]),
        fieldTranslations:
            FieldTranslations.fromJson(json["fieldTranslations"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "shortName": shortName,
        "position": position,
        "jerseyNumber": jerseyNumber,
        "height": height,
        "userCount": userCount,
        "id": id,
        "marketValueCurrency": marketValueCurrency,
        "dateOfBirthTimestamp": dateOfBirthTimestamp,
        "proposedMarketValueRaw": proposedMarketValueRaw.toJson(),
        "fieldTranslations": fieldTranslations.toJson(),
      };
}

class FieldTranslations {
  NameTranslation nameTranslation;
  NameTranslation shortNameTranslation;

  FieldTranslations({
    required this.nameTranslation,
    required this.shortNameTranslation,
  });

  factory FieldTranslations.fromJson(Map<String, dynamic> json) =>
      FieldTranslations(
        nameTranslation: NameTranslation.fromJson(json["nameTranslation"]),
        shortNameTranslation:
            NameTranslation.fromJson(json["shortNameTranslation"]),
      );

  Map<String, dynamic> toJson() => {
        "nameTranslation": nameTranslation.toJson(),
        "shortNameTranslation": shortNameTranslation.toJson(),
      };
}

class NameTranslation {
  String ar;

  NameTranslation({
    required this.ar,
  });

  factory NameTranslation.fromJson(Map<String, dynamic> json) =>
      NameTranslation(
        ar: json["ar"],
      );

  Map<String, dynamic> toJson() => {
        "ar": ar,
      };
}

class ProposedMarketValueRaw {
  int value;
  String currency;

  ProposedMarketValueRaw({
    required this.value,
    required this.currency,
  });

  factory ProposedMarketValueRaw.fromJson(Map<String, dynamic> json) =>
      ProposedMarketValueRaw(
        value: json["value"],
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "currency": currency,
      };
}
