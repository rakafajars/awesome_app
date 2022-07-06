import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'list_image_response.freezed.dart';
part 'list_image_response.g.dart';

ListImageResponse listImageResponseFromJson(String str) => ListImageResponse.fromJson(json.decode(str));


@freezed
abstract class ListImageResponse with _$ListImageResponse {
  const factory ListImageResponse({
    int? page,
    int? perPage,
    List<Photo>? photos,
    int? totalResults,
    String? nextPage,
  }) = _ListImageResponse;

  factory ListImageResponse.fromJson(Map<String, dynamic> json) => _$ListImageResponseFromJson(json);
}

@freezed
abstract class Photo with _$Photo {
  const factory Photo({
    int? id,
    int? width,
    int? height,
    String? url,
    String? photographer,
    String? photographerUrl,
    int? photographerId,
    String? avgColor,
    Src? src,
    bool? liked,
    String? alt,
  }) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}

@freezed
abstract class Src with _$Src {
  const factory Src({
    String? original,
    String? large2X,
    String? large,
    String? medium,
    String? small,
    String? portrait,
    String? landscape,
    String? tiny,
  }) = _Src;

  factory Src.fromJson(Map<String, dynamic> json) => _$SrcFromJson(json);
}
