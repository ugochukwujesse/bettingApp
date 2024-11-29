import 'dart:convert';

// To parse this JSON data, do
//
//     final highlightResponseModel = highlightResponseModelFromJson(jsonString);

HighlightResponseModel highlightResponseModelFromJson(String str) =>
    HighlightResponseModel.fromJson(json.decode(str));

String highlightResponseModelToJson(HighlightResponseModel data) =>
    json.encode(data.toJson());

class HighlightResponseModel {
  bool success;
  Data data;

  HighlightResponseModel({
    required this.success,
    required this.data,
  });

  factory HighlightResponseModel.fromJson(Map<String, dynamic> json) =>
      HighlightResponseModel(
        success: json["success"] ?? true,
        data: json["data"] != null
            ? Data.fromJson(json["data"])
            : Data(highlights: []),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };
}

class Data {
  List<Highlight> highlights;

  Data({
    required this.highlights,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      highlights: List<Highlight>.from(
        json["highlights"].map((x) {
          return Highlight.fromJson(x);
        }),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        "highlights": List<dynamic>.from(highlights.map((x) => x.toJson())),
      };
}

class Highlight {
  String title;
  String subtitle;
  String url;
  String thumbnailUrl;
  int mediaType;
  bool doFollow;
  bool keyHighlight;
  int id;
  int createdAtTimestamp;
  String sourceUrl;

  Highlight({
    required this.title,
    required this.subtitle,
    required this.url,
    required this.thumbnailUrl,
    required this.mediaType,
    required this.doFollow,
    required this.keyHighlight,
    required this.id,
    required this.createdAtTimestamp,
    required this.sourceUrl,
  });

  factory Highlight.fromJson(Map<String, dynamic> json) => Highlight(
        title: json["title"] ?? "",
        subtitle: json["subtitle"] ?? "",
        url: json["url"] ?? "",
        thumbnailUrl: json["thumbnailUrl"] ?? "",
        mediaType: json["mediaType"] ?? 0,
        doFollow: json["doFollow"] ?? false,
        keyHighlight: json["keyHighlight"] ?? false,
        id: json["id"] ?? 0,
        createdAtTimestamp: json["createdAtTimestamp"] ?? 0,
        sourceUrl: json["sourceUrl"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
        "mediaType": mediaType,
        "doFollow": doFollow,
        "keyHighlight": keyHighlight,
        "id": id,
        "createdAtTimestamp": createdAtTimestamp,
        "sourceUrl": sourceUrl,
      };
}
