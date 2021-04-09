import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true, createToJson: false)
class Items {
  List<Item> items = [];
  Items(this.items);
}

@JsonSerializable(explicitToJson: true, createToJson: false)
class Item {
  String kind;
  String etag;
  Id id;
  Snippet snippet;

  // コンストラクタ
  Item({
    this.kind,
    this.etag,
    this.id,
    this.snippet,
  });
}

@JsonSerializable(createToJson: false)
class Id {
  String kind;
  String videoId;
  String channelId;
  String playlistId;

  // コンストラクタ
  Id({
    this.kind,
    this.videoId,
    this.channelId,
    this.playlistId,
  });
}

@JsonSerializable(explicitToJson: true, createToJson: false)
class Snippet {
  String publishedAt;
  String channelId;
  String title;
  String description;
  String channelTitle;
  Thumbnails thumbnails;

  Snippet({
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.channelTitle,
  });
}

@JsonSerializable(explicitToJson: true, createToJson: false)
class Thumbnails {
  @JsonKey(name: 'default')
  Thumbnail defaultThumbnail;
  @JsonKey(name: 'medium')
  Thumbnail mediumThumbnail;
  @JsonKey(name: 'high')
  Thumbnail highThumbnail;

  Thumbnails({
    this.defaultThumbnail,
    this.mediumThumbnail,
    this.highThumbnail,
  });
}

@JsonSerializable(createToJson: false)
class Thumbnail {
  String url;
  String width;
  String height;
}
