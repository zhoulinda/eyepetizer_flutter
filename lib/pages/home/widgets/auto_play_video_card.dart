import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/// 描述 :    自动播放Video Card
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/16
///
class AutoPlayVideoCard extends StatefulWidget {
  const AutoPlayVideoCard({Key key, this.playUrl}) : super(key: key);
  final String playUrl;

  @override
  State createState() {
    return AutoPlayVideoCardState(playUrl);
  }
}

class AutoPlayVideoCardState extends State<AutoPlayVideoCard> {
  String playUrl;
  ChewieController _chewieController;
  VideoPlayerController _videoPlayerController;

  AutoPlayVideoCardState(String playUrl) {
    this.playUrl = playUrl;
  }

  @override
  void initState() {
    super.initState();
    initVideoPlayer();
  }

  @override
  void dispose() {
    super.dispose();
    _chewieController.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: MediaQuery
          .of(context)
          .size
          .width * 9.0 / 16,
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }

  void initVideoPlayer() {
    _videoPlayerController =
        VideoPlayerController.network(playUrl);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: true,
      showControls: true,
      placeholder: Container(color: Colors.black),
      // 是否在 UI 构建的时候就加载视频
      autoInitialize: !true,
      // 拖动条样式颜色
      materialProgressColors: new ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.blue,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.lightGreen,
      ),
    );
  }
}
