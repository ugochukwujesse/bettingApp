// To parse this JSON data, do
//
//     final incidentResponseModel = incidentResponseModelFromJson(jsonString);

import 'dart:convert';

IncidentResponseModel incidentResponseModelFromJson(String str) =>
    IncidentResponseModel.fromJson(json.decode(str));

String incidentResponseModelToJson(IncidentResponseModel data) =>
    json.encode(data.toJson());

class IncidentResponseModel {
  bool success;
  Data data;

  IncidentResponseModel({
    required this.success,
    required this.data,
  });

  factory IncidentResponseModel.fromJson(Map<String, dynamic> json) =>
      IncidentResponseModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };
}

class Data {
  List<Incident> incidents;
  Away home;
  Away away;

  Data({
    required this.incidents,
    required this.home,
    required this.away,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        incidents: List<Incident>.from(
            json["incidents"].map((x) => Incident.fromJson(x))),
        home: Away.fromJson(json["home"]),
        away: Away.fromJson(json["away"]),
      );

  Map<String, dynamic> toJson() => {
        "incidents": List<dynamic>.from(incidents.map((x) => x.toJson())),
        "home": home.toJson(),
        "away": away.toJson(),
      };
}

class Away {
  ErColor goalkeeperColor;
  ErColor playerColor;

  Away({
    required this.goalkeeperColor,
    required this.playerColor,
  });

  factory Away.fromJson(Map<String, dynamic> json) => Away(
        goalkeeperColor: ErColor.fromJson(json["goalkeeperColor"]),
        playerColor: ErColor.fromJson(json["playerColor"]),
      );

  Map<String, dynamic> toJson() => {
        "goalkeeperColor": goalkeeperColor.toJson(),
        "playerColor": playerColor.toJson(),
      };
}

class ErColor {
  String primary;
  String number;
  String outline;
  String fancyNumber;

  ErColor({
    required this.primary,
    required this.number,
    required this.outline,
    required this.fancyNumber,
  });

  factory ErColor.fromJson(Map<String, dynamic> json) => ErColor(
        primary: json["primary"],
        number: json["number"],
        outline: json["outline"],
        fancyNumber: json["fancyNumber"],
      );

  Map<String, dynamic> toJson() => {
        "primary": primary,
        "number": number,
        "outline": outline,
        "fancyNumber": fancyNumber,
      };
}

class Incident {
  String? text;
  int? homeScore;
  int? awayScore;
  bool? isLive;
  int? time;
  int? addedTime;
  int? timeSeconds;
  int? reversedPeriodTime;
  int? reversedPeriodTimeSeconds;
  String incidentType;
  Player? player;
  int? sequence;
  Description? description;
  int? id;
  bool? isHome;
  String? incidentClass;
  Reason? reason;
  int? length;
  Player? playerIn;
  Player? playerOut;
  bool? injury;
  String? playerName;
  bool? rescinded;
  List<dynamic>? footballPassingNetworkAction;

  Incident({
    this.text,
    this.homeScore,
    this.awayScore,
    this.isLive,
    this.time,
    this.addedTime,
    this.timeSeconds,
    this.reversedPeriodTime,
    this.reversedPeriodTimeSeconds,
    required this.incidentType,
    this.player,
    this.sequence,
    this.description,
    this.id,
    this.isHome,
    this.incidentClass,
    this.reason,
    this.length,
    this.playerIn,
    this.playerOut,
    this.injury,
    this.playerName,
    this.rescinded,
    this.footballPassingNetworkAction,
  });

  factory Incident.fromJson(Map<String, dynamic> json) => Incident(
        text: json["text"],
        homeScore: json["homeScore"],
        awayScore: json["awayScore"],
        isLive: json["isLive"],
        time: json["time"],
        addedTime: json["addedTime"],
        timeSeconds: json["timeSeconds"],
        reversedPeriodTime: json["reversedPeriodTime"],
        reversedPeriodTimeSeconds: json["reversedPeriodTimeSeconds"],
        incidentType: json["incidentType"],
        player: json["player"] == null ? null : Player.fromJson(json["player"]),
        sequence: json["sequence"],
        description: descriptionValues.map[json["description"]]!,
        id: json["id"],
        isHome: json["isHome"],
        incidentClass: json["incidentClass"],
        reason: reasonValues.map[json["reason"]]!,
        length: json["length"],
        playerIn:
            json["playerIn"] == null ? null : Player.fromJson(json["playerIn"]),
        playerOut: json["playerOut"] == null
            ? null
            : Player.fromJson(json["playerOut"]),
        injury: json["injury"],
        playerName: json["playerName"],
        rescinded: json["rescinded"],
        footballPassingNetworkAction:
            json["footballPassingNetworkAction"] == null
                ? []
                : List<dynamic>.from(
                    json["footballPassingNetworkAction"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "homeScore": homeScore,
        "awayScore": awayScore,
        "isLive": isLive,
        "time": time,
        "addedTime": addedTime,
        "timeSeconds": timeSeconds,
        "reversedPeriodTime": reversedPeriodTime,
        "reversedPeriodTimeSeconds": reversedPeriodTimeSeconds,
        "incidentType": incidentType,
        "player": player?.toJson(),
        "sequence": sequence,
        "description": descriptionValues.reverse[description],
        "id": id,
        "isHome": isHome,
        "incidentClass": incidentClass,
        "reason": reasonValues.reverse[reason],
        "length": length,
        "playerIn": playerIn?.toJson(),
        "playerOut": playerOut?.toJson(),
        "injury": injury,
        "playerName": playerName,
        "rescinded": rescinded,
        "footballPassingNetworkAction": footballPassingNetworkAction == null
            ? []
            : List<dynamic>.from(footballPassingNetworkAction!.map((x) => x)),
      };
}

enum Description { GOALKEEPER_SAVE, SCORED }

final descriptionValues = EnumValues({
  "Goalkeeper save": Description.GOALKEEPER_SAVE,
  "Scored": Description.SCORED
});

class Player {
  String name;
  String slug;
  String shortName;
  Position position;
  String? jerseyNumber;
  int height;
  int userCount;
  int id;
  Currency marketValueCurrency;
  int dateOfBirthTimestamp;
  ProposedMarketValueRaw? proposedMarketValueRaw;
  FieldTranslations fieldTranslations;
  String? firstName;
  String? lastName;

  Player({
    required this.name,
    required this.slug,
    required this.shortName,
    required this.position,
    this.jerseyNumber,
    required this.height,
    required this.userCount,
    required this.id,
    required this.marketValueCurrency,
    required this.dateOfBirthTimestamp,
    this.proposedMarketValueRaw,
    required this.fieldTranslations,
    this.firstName,
    this.lastName,
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        name: json["name"],
        slug: json["slug"],
        shortName: json["shortName"],
        position: positionValues.map[json["position"]]!,
        jerseyNumber: json["jerseyNumber"],
        height: json["height"],
        userCount: json["userCount"],
        id: json["id"],
        marketValueCurrency: currencyValues.map[json["marketValueCurrency"]]!,
        dateOfBirthTimestamp: json["dateOfBirthTimestamp"],
        proposedMarketValueRaw: json["proposedMarketValueRaw"] == null
            ? null
            : ProposedMarketValueRaw.fromJson(json["proposedMarketValueRaw"]),
        fieldTranslations:
            FieldTranslations.fromJson(json["fieldTranslations"]),
        firstName: json["firstName"],
        lastName: json["lastName"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "shortName": shortName,
        "position": positionValues.reverse[position],
        "jerseyNumber": jerseyNumber,
        "height": height,
        "userCount": userCount,
        "id": id,
        "marketValueCurrency": currencyValues.reverse[marketValueCurrency],
        "dateOfBirthTimestamp": dateOfBirthTimestamp,
        "proposedMarketValueRaw": proposedMarketValueRaw?.toJson(),
        "fieldTranslations": fieldTranslations.toJson(),
        "firstName": firstName,
        "lastName": lastName,
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

enum Currency { EUR }

final currencyValues = EnumValues({"EUR": Currency.EUR});

enum Position { D, F, G, M }

final positionValues = EnumValues(
    {"D": Position.D, "F": Position.F, "G": Position.G, "M": Position.M});

class ProposedMarketValueRaw {
  int value;
  Currency currency;

  ProposedMarketValueRaw({
    required this.value,
    required this.currency,
  });

  factory ProposedMarketValueRaw.fromJson(Map<String, dynamic> json) =>
      ProposedMarketValueRaw(
        value: json["value"],
        currency: currencyValues.map[json["currency"]]!,
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "currency": currencyValues.reverse[currency],
      };
}

enum Reason { FOUL, GOALKEEPER_SAVE, SCORED }

final reasonValues = EnumValues({
  "Foul": Reason.FOUL,
  "goalkeeperSave": Reason.GOALKEEPER_SAVE,
  "scored": Reason.SCORED
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
