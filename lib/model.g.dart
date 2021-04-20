// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Items _$ItemsFromJson(Map<String, dynamic> json) {
  return Items(
    items: (json['items'] as List<dynamic>?)
        ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
    kind: json['kind'] as String?,
    etag: json['etag'] as String?,
    id: json['id'] == null
        ? null
        : Id.fromJson(json['id'] as Map<String, dynamic>),
    snippet: json['snippet'] == null
        ? null
        : Snippet.fromJson(json['snippet'] as Map<String, dynamic>),
  );
}

Id _$IdFromJson(Map<String, dynamic> json) {
  return Id(
    kind: json['kind'] as String?,
    videoId: json['videoId'] as String?,
    channelId: json['channelId'] as String?,
    playlistId: json['playlistId'] as String?,
  );
}

Snippet _$SnippetFromJson(Map<String, dynamic> json) {
  return Snippet(
    publishedAt: json['publishedAt'] as String?,
    channelId: json['channelId'] as String?,
    title: json['title'] as String?,
    description: json['description'] as String?,
    channelTitle: json['channelTitle'] as String?,
  )..thumbnails = json['thumbnails'] == null
      ? null
      : Thumbnails.fromJson(json['thumbnails'] as Map<String, dynamic>);
}

Thumbnails _$ThumbnailsFromJson(Map<String, dynamic> json) {
  return Thumbnails(
    defaultThumbnail: json['default'] == null
        ? null
        : Thumbnail.fromJson(json['default'] as Map<String, dynamic>),
    mediumThumbnail: json['medium'] == null
        ? null
        : Thumbnail.fromJson(json['medium'] as Map<String, dynamic>),
    highThumbnail: json['high'] == null
        ? null
        : Thumbnail.fromJson(json['high'] as Map<String, dynamic>),
  );
}

Thumbnail _$ThumbnailFromJson(Map<String, dynamic> json) {
  return Thumbnail()
    ..url = json['url'] as String?
    ..width = json['width'] as int?
    ..height = json['height'] as int?;
}
