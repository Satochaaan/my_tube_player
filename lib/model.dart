import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: false)
class Items {
  List<Item>? items = [];

  // コンストラクタ
  Items({this.items});

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);
}

@JsonSerializable(explicitToJson: true, createToJson: false)
class Item {
  String? kind;
  String? etag;
  Id? id;
  Snippet? snippet;

  // コンストラクタ
  Item({
    this.kind,
    this.etag,
    this.id,
    this.snippet,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

@JsonSerializable(createToJson: false)
class Id {
  String? kind;
  String? videoId;
  String? channelId;
  String? playlistId;

  // コンストラクタ
  Id({
    this.kind,
    this.videoId,
    this.channelId,
    this.playlistId,
  });

  factory Id.fromJson(Map<String, dynamic> json) => _$IdFromJson(json);
}

@JsonSerializable(explicitToJson: true, createToJson: false)
class Snippet {
  String? publishedAt;
  String? channelId;
  String? title;
  String? description;
  String? channelTitle;
  Thumbnails? thumbnails;

  // コンストラクタ
  Snippet({
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.channelTitle,
  });

  factory Snippet.fromJson(Map<String, dynamic> json) =>
      _$SnippetFromJson(json);
}

@JsonSerializable(explicitToJson: true, createToJson: false)
class Thumbnails {
  @JsonKey(name: 'default')
  Thumbnail? defaultThumbnail;
  @JsonKey(name: 'medium')
  Thumbnail? mediumThumbnail;
  @JsonKey(name: 'high')
  Thumbnail? highThumbnail;

  // コンストラクタ
  Thumbnails({
    this.defaultThumbnail,
    this.mediumThumbnail,
    this.highThumbnail,
  });

  factory Thumbnails.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailsFromJson(json);
}

@JsonSerializable(createToJson: false)
class Thumbnail {
  String? url;
  int? width;
  int? height;

  // コンストラクタ
  Thumbnail({this.url, this.width, this.height});

  factory Thumbnail.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailFromJson(json);
}
