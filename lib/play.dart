import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoPlayer extends StatefulWidget {
  VideoPlayer({Key? key, required this.videoTitle, required this.videoId})
      : super(key: key);

  final String videoTitle;
  final String videoId;

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  // VideoPlayerController _videoPlayerController;
  // ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.arrow_back_outlined),
        title: Text(widget.videoTitle),
      ),
      body: Center(
        child: Text('再生画面'),
      ),
    );
  }
}
