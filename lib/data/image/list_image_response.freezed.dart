// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'list_image_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListImageResponse _$ListImageResponseFromJson(Map<String, dynamic> json) {
  return _ListImageResponse.fromJson(json);
}

/// @nodoc
mixin _$ListImageResponse {
  int? get page => throw _privateConstructorUsedError;
  int? get perPage => throw _privateConstructorUsedError;
  List<Photo>? get photos => throw _privateConstructorUsedError;
  int? get totalResults => throw _privateConstructorUsedError;
  String? get nextPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListImageResponseCopyWith<ListImageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListImageResponseCopyWith<$Res> {
  factory $ListImageResponseCopyWith(
          ListImageResponse value, $Res Function(ListImageResponse) then) =
      _$ListImageResponseCopyWithImpl<$Res>;
  $Res call(
      {int? page,
      int? perPage,
      List<Photo>? photos,
      int? totalResults,
      String? nextPage});
}

/// @nodoc
class _$ListImageResponseCopyWithImpl<$Res>
    implements $ListImageResponseCopyWith<$Res> {
  _$ListImageResponseCopyWithImpl(this._value, this._then);

  final ListImageResponse _value;
  // ignore: unused_field
  final $Res Function(ListImageResponse) _then;

  @override
  $Res call({
    Object? page = freezed,
    Object? perPage = freezed,
    Object? photos = freezed,
    Object? totalResults = freezed,
    Object? nextPage = freezed,
  }) {
    return _then(_value.copyWith(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: perPage == freezed
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      photos: photos == freezed
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<Photo>?,
      totalResults: totalResults == freezed
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
      nextPage: nextPage == freezed
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ListImageResponseCopyWith<$Res>
    implements $ListImageResponseCopyWith<$Res> {
  factory _$$_ListImageResponseCopyWith(_$_ListImageResponse value,
          $Res Function(_$_ListImageResponse) then) =
      __$$_ListImageResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? page,
      int? perPage,
      List<Photo>? photos,
      int? totalResults,
      String? nextPage});
}

/// @nodoc
class __$$_ListImageResponseCopyWithImpl<$Res>
    extends _$ListImageResponseCopyWithImpl<$Res>
    implements _$$_ListImageResponseCopyWith<$Res> {
  __$$_ListImageResponseCopyWithImpl(
      _$_ListImageResponse _value, $Res Function(_$_ListImageResponse) _then)
      : super(_value, (v) => _then(v as _$_ListImageResponse));

  @override
  _$_ListImageResponse get _value => super._value as _$_ListImageResponse;

  @override
  $Res call({
    Object? page = freezed,
    Object? perPage = freezed,
    Object? photos = freezed,
    Object? totalResults = freezed,
    Object? nextPage = freezed,
  }) {
    return _then(_$_ListImageResponse(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: perPage == freezed
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      photos: photos == freezed
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<Photo>?,
      totalResults: totalResults == freezed
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
      nextPage: nextPage == freezed
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListImageResponse implements _ListImageResponse {
  const _$_ListImageResponse(
      {this.page,
      this.perPage,
      final List<Photo>? photos,
      this.totalResults,
      this.nextPage})
      : _photos = photos;

  factory _$_ListImageResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ListImageResponseFromJson(json);

  @override
  final int? page;
  @override
  final int? perPage;
  final List<Photo>? _photos;
  @override
  List<Photo>? get photos {
    final value = _photos;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? totalResults;
  @override
  final String? nextPage;

  @override
  String toString() {
    return 'ListImageResponse(page: $page, perPage: $perPage, photos: $photos, totalResults: $totalResults, nextPage: $nextPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListImageResponse &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality().equals(other.perPage, perPage) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            const DeepCollectionEquality()
                .equals(other.totalResults, totalResults) &&
            const DeepCollectionEquality().equals(other.nextPage, nextPage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(page),
      const DeepCollectionEquality().hash(perPage),
      const DeepCollectionEquality().hash(_photos),
      const DeepCollectionEquality().hash(totalResults),
      const DeepCollectionEquality().hash(nextPage));

  @JsonKey(ignore: true)
  @override
  _$$_ListImageResponseCopyWith<_$_ListImageResponse> get copyWith =>
      __$$_ListImageResponseCopyWithImpl<_$_ListImageResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListImageResponseToJson(this);
  }
}

abstract class _ListImageResponse implements ListImageResponse {
  const factory _ListImageResponse(
      {final int? page,
      final int? perPage,
      final List<Photo>? photos,
      final int? totalResults,
      final String? nextPage}) = _$_ListImageResponse;

  factory _ListImageResponse.fromJson(Map<String, dynamic> json) =
      _$_ListImageResponse.fromJson;

  @override
  int? get page;
  @override
  int? get perPage;
  @override
  List<Photo>? get photos;
  @override
  int? get totalResults;
  @override
  String? get nextPage;
  @override
  @JsonKey(ignore: true)
  _$$_ListImageResponseCopyWith<_$_ListImageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

Photo _$PhotoFromJson(Map<String, dynamic> json) {
  return _Photo.fromJson(json);
}

/// @nodoc
mixin _$Photo {
  int? get id => throw _privateConstructorUsedError;
  int? get width => throw _privateConstructorUsedError;
  int? get height => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get photographer => throw _privateConstructorUsedError;
  String? get photographerUrl => throw _privateConstructorUsedError;
  int? get photographerId => throw _privateConstructorUsedError;
  String? get avgColor => throw _privateConstructorUsedError;
  Src? get src => throw _privateConstructorUsedError;
  bool? get liked => throw _privateConstructorUsedError;
  String? get alt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhotoCopyWith<Photo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoCopyWith<$Res> {
  factory $PhotoCopyWith(Photo value, $Res Function(Photo) then) =
      _$PhotoCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      int? width,
      int? height,
      String? url,
      String? photographer,
      String? photographerUrl,
      int? photographerId,
      String? avgColor,
      Src? src,
      bool? liked,
      String? alt});

  $SrcCopyWith<$Res>? get src;
}

/// @nodoc
class _$PhotoCopyWithImpl<$Res> implements $PhotoCopyWith<$Res> {
  _$PhotoCopyWithImpl(this._value, this._then);

  final Photo _value;
  // ignore: unused_field
  final $Res Function(Photo) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? url = freezed,
    Object? photographer = freezed,
    Object? photographerUrl = freezed,
    Object? photographerId = freezed,
    Object? avgColor = freezed,
    Object? src = freezed,
    Object? liked = freezed,
    Object? alt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      photographer: photographer == freezed
          ? _value.photographer
          : photographer // ignore: cast_nullable_to_non_nullable
              as String?,
      photographerUrl: photographerUrl == freezed
          ? _value.photographerUrl
          : photographerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      photographerId: photographerId == freezed
          ? _value.photographerId
          : photographerId // ignore: cast_nullable_to_non_nullable
              as int?,
      avgColor: avgColor == freezed
          ? _value.avgColor
          : avgColor // ignore: cast_nullable_to_non_nullable
              as String?,
      src: src == freezed
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as Src?,
      liked: liked == freezed
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool?,
      alt: alt == freezed
          ? _value.alt
          : alt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $SrcCopyWith<$Res>? get src {
    if (_value.src == null) {
      return null;
    }

    return $SrcCopyWith<$Res>(_value.src!, (value) {
      return _then(_value.copyWith(src: value));
    });
  }
}

/// @nodoc
abstract class _$$_PhotoCopyWith<$Res> implements $PhotoCopyWith<$Res> {
  factory _$$_PhotoCopyWith(_$_Photo value, $Res Function(_$_Photo) then) =
      __$$_PhotoCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      int? width,
      int? height,
      String? url,
      String? photographer,
      String? photographerUrl,
      int? photographerId,
      String? avgColor,
      Src? src,
      bool? liked,
      String? alt});

  @override
  $SrcCopyWith<$Res>? get src;
}

/// @nodoc
class __$$_PhotoCopyWithImpl<$Res> extends _$PhotoCopyWithImpl<$Res>
    implements _$$_PhotoCopyWith<$Res> {
  __$$_PhotoCopyWithImpl(_$_Photo _value, $Res Function(_$_Photo) _then)
      : super(_value, (v) => _then(v as _$_Photo));

  @override
  _$_Photo get _value => super._value as _$_Photo;

  @override
  $Res call({
    Object? id = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? url = freezed,
    Object? photographer = freezed,
    Object? photographerUrl = freezed,
    Object? photographerId = freezed,
    Object? avgColor = freezed,
    Object? src = freezed,
    Object? liked = freezed,
    Object? alt = freezed,
  }) {
    return _then(_$_Photo(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      photographer: photographer == freezed
          ? _value.photographer
          : photographer // ignore: cast_nullable_to_non_nullable
              as String?,
      photographerUrl: photographerUrl == freezed
          ? _value.photographerUrl
          : photographerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      photographerId: photographerId == freezed
          ? _value.photographerId
          : photographerId // ignore: cast_nullable_to_non_nullable
              as int?,
      avgColor: avgColor == freezed
          ? _value.avgColor
          : avgColor // ignore: cast_nullable_to_non_nullable
              as String?,
      src: src == freezed
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as Src?,
      liked: liked == freezed
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool?,
      alt: alt == freezed
          ? _value.alt
          : alt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Photo implements _Photo {
  const _$_Photo(
      {this.id,
      this.width,
      this.height,
      this.url,
      this.photographer,
      this.photographerUrl,
      this.photographerId,
      this.avgColor,
      this.src,
      this.liked,
      this.alt});

  factory _$_Photo.fromJson(Map<String, dynamic> json) =>
      _$$_PhotoFromJson(json);

  @override
  final int? id;
  @override
  final int? width;
  @override
  final int? height;
  @override
  final String? url;
  @override
  final String? photographer;
  @override
  final String? photographerUrl;
  @override
  final int? photographerId;
  @override
  final String? avgColor;
  @override
  final Src? src;
  @override
  final bool? liked;
  @override
  final String? alt;

  @override
  String toString() {
    return 'Photo(id: $id, width: $width, height: $height, url: $url, photographer: $photographer, photographerUrl: $photographerUrl, photographerId: $photographerId, avgColor: $avgColor, src: $src, liked: $liked, alt: $alt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Photo &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.width, width) &&
            const DeepCollectionEquality().equals(other.height, height) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality()
                .equals(other.photographer, photographer) &&
            const DeepCollectionEquality()
                .equals(other.photographerUrl, photographerUrl) &&
            const DeepCollectionEquality()
                .equals(other.photographerId, photographerId) &&
            const DeepCollectionEquality().equals(other.avgColor, avgColor) &&
            const DeepCollectionEquality().equals(other.src, src) &&
            const DeepCollectionEquality().equals(other.liked, liked) &&
            const DeepCollectionEquality().equals(other.alt, alt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(width),
      const DeepCollectionEquality().hash(height),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(photographer),
      const DeepCollectionEquality().hash(photographerUrl),
      const DeepCollectionEquality().hash(photographerId),
      const DeepCollectionEquality().hash(avgColor),
      const DeepCollectionEquality().hash(src),
      const DeepCollectionEquality().hash(liked),
      const DeepCollectionEquality().hash(alt));

  @JsonKey(ignore: true)
  @override
  _$$_PhotoCopyWith<_$_Photo> get copyWith =>
      __$$_PhotoCopyWithImpl<_$_Photo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PhotoToJson(this);
  }
}

abstract class _Photo implements Photo {
  const factory _Photo(
      {final int? id,
      final int? width,
      final int? height,
      final String? url,
      final String? photographer,
      final String? photographerUrl,
      final int? photographerId,
      final String? avgColor,
      final Src? src,
      final bool? liked,
      final String? alt}) = _$_Photo;

  factory _Photo.fromJson(Map<String, dynamic> json) = _$_Photo.fromJson;

  @override
  int? get id;
  @override
  int? get width;
  @override
  int? get height;
  @override
  String? get url;
  @override
  String? get photographer;
  @override
  String? get photographerUrl;
  @override
  int? get photographerId;
  @override
  String? get avgColor;
  @override
  Src? get src;
  @override
  bool? get liked;
  @override
  String? get alt;
  @override
  @JsonKey(ignore: true)
  _$$_PhotoCopyWith<_$_Photo> get copyWith =>
      throw _privateConstructorUsedError;
}

Src _$SrcFromJson(Map<String, dynamic> json) {
  return _Src.fromJson(json);
}

/// @nodoc
mixin _$Src {
  String? get original => throw _privateConstructorUsedError;
  String? get large2X => throw _privateConstructorUsedError;
  String? get large => throw _privateConstructorUsedError;
  String? get medium => throw _privateConstructorUsedError;
  String? get small => throw _privateConstructorUsedError;
  String? get portrait => throw _privateConstructorUsedError;
  String? get landscape => throw _privateConstructorUsedError;
  String? get tiny => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SrcCopyWith<Src> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SrcCopyWith<$Res> {
  factory $SrcCopyWith(Src value, $Res Function(Src) then) =
      _$SrcCopyWithImpl<$Res>;
  $Res call(
      {String? original,
      String? large2X,
      String? large,
      String? medium,
      String? small,
      String? portrait,
      String? landscape,
      String? tiny});
}

/// @nodoc
class _$SrcCopyWithImpl<$Res> implements $SrcCopyWith<$Res> {
  _$SrcCopyWithImpl(this._value, this._then);

  final Src _value;
  // ignore: unused_field
  final $Res Function(Src) _then;

  @override
  $Res call({
    Object? original = freezed,
    Object? large2X = freezed,
    Object? large = freezed,
    Object? medium = freezed,
    Object? small = freezed,
    Object? portrait = freezed,
    Object? landscape = freezed,
    Object? tiny = freezed,
  }) {
    return _then(_value.copyWith(
      original: original == freezed
          ? _value.original
          : original // ignore: cast_nullable_to_non_nullable
              as String?,
      large2X: large2X == freezed
          ? _value.large2X
          : large2X // ignore: cast_nullable_to_non_nullable
              as String?,
      large: large == freezed
          ? _value.large
          : large // ignore: cast_nullable_to_non_nullable
              as String?,
      medium: medium == freezed
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as String?,
      small: small == freezed
          ? _value.small
          : small // ignore: cast_nullable_to_non_nullable
              as String?,
      portrait: portrait == freezed
          ? _value.portrait
          : portrait // ignore: cast_nullable_to_non_nullable
              as String?,
      landscape: landscape == freezed
          ? _value.landscape
          : landscape // ignore: cast_nullable_to_non_nullable
              as String?,
      tiny: tiny == freezed
          ? _value.tiny
          : tiny // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_SrcCopyWith<$Res> implements $SrcCopyWith<$Res> {
  factory _$$_SrcCopyWith(_$_Src value, $Res Function(_$_Src) then) =
      __$$_SrcCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? original,
      String? large2X,
      String? large,
      String? medium,
      String? small,
      String? portrait,
      String? landscape,
      String? tiny});
}

/// @nodoc
class __$$_SrcCopyWithImpl<$Res> extends _$SrcCopyWithImpl<$Res>
    implements _$$_SrcCopyWith<$Res> {
  __$$_SrcCopyWithImpl(_$_Src _value, $Res Function(_$_Src) _then)
      : super(_value, (v) => _then(v as _$_Src));

  @override
  _$_Src get _value => super._value as _$_Src;

  @override
  $Res call({
    Object? original = freezed,
    Object? large2X = freezed,
    Object? large = freezed,
    Object? medium = freezed,
    Object? small = freezed,
    Object? portrait = freezed,
    Object? landscape = freezed,
    Object? tiny = freezed,
  }) {
    return _then(_$_Src(
      original: original == freezed
          ? _value.original
          : original // ignore: cast_nullable_to_non_nullable
              as String?,
      large2X: large2X == freezed
          ? _value.large2X
          : large2X // ignore: cast_nullable_to_non_nullable
              as String?,
      large: large == freezed
          ? _value.large
          : large // ignore: cast_nullable_to_non_nullable
              as String?,
      medium: medium == freezed
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as String?,
      small: small == freezed
          ? _value.small
          : small // ignore: cast_nullable_to_non_nullable
              as String?,
      portrait: portrait == freezed
          ? _value.portrait
          : portrait // ignore: cast_nullable_to_non_nullable
              as String?,
      landscape: landscape == freezed
          ? _value.landscape
          : landscape // ignore: cast_nullable_to_non_nullable
              as String?,
      tiny: tiny == freezed
          ? _value.tiny
          : tiny // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Src implements _Src {
  const _$_Src(
      {this.original,
      this.large2X,
      this.large,
      this.medium,
      this.small,
      this.portrait,
      this.landscape,
      this.tiny});

  factory _$_Src.fromJson(Map<String, dynamic> json) => _$$_SrcFromJson(json);

  @override
  final String? original;
  @override
  final String? large2X;
  @override
  final String? large;
  @override
  final String? medium;
  @override
  final String? small;
  @override
  final String? portrait;
  @override
  final String? landscape;
  @override
  final String? tiny;

  @override
  String toString() {
    return 'Src(original: $original, large2X: $large2X, large: $large, medium: $medium, small: $small, portrait: $portrait, landscape: $landscape, tiny: $tiny)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Src &&
            const DeepCollectionEquality().equals(other.original, original) &&
            const DeepCollectionEquality().equals(other.large2X, large2X) &&
            const DeepCollectionEquality().equals(other.large, large) &&
            const DeepCollectionEquality().equals(other.medium, medium) &&
            const DeepCollectionEquality().equals(other.small, small) &&
            const DeepCollectionEquality().equals(other.portrait, portrait) &&
            const DeepCollectionEquality().equals(other.landscape, landscape) &&
            const DeepCollectionEquality().equals(other.tiny, tiny));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(original),
      const DeepCollectionEquality().hash(large2X),
      const DeepCollectionEquality().hash(large),
      const DeepCollectionEquality().hash(medium),
      const DeepCollectionEquality().hash(small),
      const DeepCollectionEquality().hash(portrait),
      const DeepCollectionEquality().hash(landscape),
      const DeepCollectionEquality().hash(tiny));

  @JsonKey(ignore: true)
  @override
  _$$_SrcCopyWith<_$_Src> get copyWith =>
      __$$_SrcCopyWithImpl<_$_Src>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SrcToJson(this);
  }
}

abstract class _Src implements Src {
  const factory _Src(
      {final String? original,
      final String? large2X,
      final String? large,
      final String? medium,
      final String? small,
      final String? portrait,
      final String? landscape,
      final String? tiny}) = _$_Src;

  factory _Src.fromJson(Map<String, dynamic> json) = _$_Src.fromJson;

  @override
  String? get original;
  @override
  String? get large2X;
  @override
  String? get large;
  @override
  String? get medium;
  @override
  String? get small;
  @override
  String? get portrait;
  @override
  String? get landscape;
  @override
  String? get tiny;
  @override
  @JsonKey(ignore: true)
  _$$_SrcCopyWith<_$_Src> get copyWith => throw _privateConstructorUsedError;
}
