import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatefulWidget {
  VideoPlayer({Key? key, required this.videoTitle, required this.videoId})
      : super(key: key);

  final String videoTitle;
  final String videoId;

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  final String youtubeUrl = 'https://www.youtube.com/watch?v=';

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.network(youtubeUrl + widget.videoId);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: false,
      looping: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.arrow_back_outlined),
        title: Text(widget.videoTitle),
      ),
      body: Chewie(
        controller: _chewieController,
      ),
    );
  }
}
