class SearchModel {
  String videoId;
  String thumbnailUrl;
  String thumbnailWidth;
  String thumbnailHeight;
  String publishedAt;
  String title;
  String channelTitle;

  // コンストラクタ
  SearchModel(
      {this.videoId,
      this.thumbnailUrl,
      this.thumbnailWidth,
      this.thumbnailHeight,
      this.publishedAt,
      this.title,
      this.channelTitle});

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      SearchModel(videoId: json['videoId']);
}
