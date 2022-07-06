// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'dart:convert';
//
// part 'list_image_response.freezed.dart';
// part 'list_image_response.g.dart';
//
// ListImageResponse listImageResponseFromJson(String str) => ListImageResponse.fromJson(json.decode(str));
//
//
// @freezed
// abstract class ListImageResponse with _$ListImageResponse {
//   const factory ListImageResponse({
//     int? page,
//     int? perPage,
//     List<Photo>? photos,
//     int? totalResults,
//     String? nextPage,
//   }) = _ListImageResponse;
//
//   factory ListImageResponse.fromJson(Map<String, dynamic> json) => _$ListImageResponseFromJson(json);
// }
//
// @freezed
// abstract class Photo with _$Photo {
//   const factory Photo({
//     int? id,
//     int? width,
//     int? height,
//     String? url,
//     String? photographer,
//     String? photographerUrl,
//     int? photographerId,
//     String? avgColor,
//     Src? src,
//     bool? liked,
//     String? alt,
//   }) = _Photo;
//
//   factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
// }
//
// @freezed
// abstract class Src with _$Src {
//   const factory Src({
//     String? original,
//     String? large2X,
//     String? large,
//     String? medium,
//     String? small,
//     String? portrait,
//     String? landscape,
//     String? tiny,
//   }) = _Src;
//
//   factory Src.fromJson(Map<String, dynamic> json) => _$SrcFromJson(json);
// }

// To parse this JSON data, do
//
//     final listImageResponse = listImageResponseFromJson(jsonString);

import 'dart:convert';

ListImageResponse listImageResponseFromJson(String str) =>
    ListImageResponse.fromJson(json.decode(str));

class ListImageResponse {
  ListImageResponse({
    this.page,
    this.perPage,
    this.photos,
    this.totalResults,
    this.nextPage,
  });

  int? page;
  int? perPage;
  List<Photo>? photos;
  int? totalResults;
  String? nextPage;

  factory ListImageResponse.fromJson(Map<String, dynamic> json) =>
      ListImageResponse(
        page: json["page"] == null ? null : json["page"],
        perPage: json["per_page"] == null ? null : json["per_page"],
        photos: json["photos"] == null
            ? null
            : List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
        totalResults:
            json["total_results"] == null ? null : json["total_results"],
        nextPage: json["next_page"] == null ? null : json["next_page"],
      );
}

class Photo {
  Photo({
    this.id,
    this.width,
    this.height,
    this.url,
    this.photographer,
    this.photographerUrl,
    this.photographerId,
    this.avgColor,
    this.src,
    this.liked,
    this.alt,
  });

  int? id;
  int? width;
  int? height;
  String? url;
  String? photographer;
  String? photographerUrl;
  int? photographerId;
  String? avgColor;
  Src? src;
  bool? liked;
  String? alt;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"] == null ? null : json["id"],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
        url: json["url"] == null ? null : json["url"],
        photographer:
            json["photographer"] == null ? null : json["photographer"],
        photographerUrl:
            json["photographer_url"] == null ? null : json["photographer_url"],
        photographerId:
            json["photographer_id"] == null ? null : json["photographer_id"],
        avgColor: json["avg_color"] == null ? null : json["avg_color"],
        src: json["src"] == null ? null : Src.fromJson(json["src"]),
        liked: json["liked"] == null ? null : json["liked"],
        alt: json["alt"] == null ? null : json["alt"],
      );
}

class Src {
  Src({
    this.original,
    this.large2X,
    this.large,
    this.medium,
    this.small,
    this.portrait,
    this.landscape,
    this.tiny,
  });

  String? original;
  String? large2X;
  String? large;
  String? medium;
  String? small;
  String? portrait;
  String? landscape;
  String? tiny;

  factory Src.fromJson(Map<String, dynamic> json) => Src(
        original: json["original"] == null ? null : json["original"],
        large2X: json["large2x"] == null ? null : json["large2x"],
        large: json["large"] == null ? null : json["large"],
        medium: json["medium"] == null ? null : json["medium"],
        small: json["small"] == null ? null : json["small"],
        portrait: json["portrait"] == null ? null : json["portrait"],
        landscape: json["landscape"] == null ? null : json["landscape"],
        tiny: json["tiny"] == null ? null : json["tiny"],
      );
}
