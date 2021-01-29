import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:eyepetizer_flutter/blocs/bloc_provider.dart';
import 'package:eyepetizer_flutter/blocs/detail_bloc.dart';
import 'package:eyepetizer_flutter/model/detail.dart';
import 'package:eyepetizer_flutter/model/item.dart';
import 'package:eyepetizer_flutter/pages/detail/widgets/author_info.dart';
import 'package:eyepetizer_flutter/pages/detail/widgets/video_info.dart';
import 'package:eyepetizer_flutter/widgets/cover_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import 'widgets/relate_videos.dart';

/// 描述 :    视频详情页
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/11/27
///
class DetailPage extends StatefulWidget {
  const DetailPage({Key key}) : super(key: key);

  @override
  _DetailState createState() {
    return _DetailState();
  }
}

class _DetailState extends State<DetailPage> {
  int videoId;
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;
  bool isLoaded = false;

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context).settings.arguments;
    var videoHeight = MediaQuery.of(context).size.width * 9.0 / 16;
    var barHeight = MediaQuery.of(context).padding.top;
    final DetailBloc bloc = BlocProvider.of<DetailBloc>(context);
    if (!isLoaded) {
      isLoaded = true;
      bloc.getDetailData(id);
      bloc.getRelateVideo(id);
    }
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: StreamBuilder<Detail>(
          stream: bloc.detailStream,
          builder: (BuildContext context, AsyncSnapshot<Detail> snapshot) {
            if (snapshot.data == null) {
              return Container();
            } else {
              return Scaffold(
                  body: OrientationBuilder(builder: (context, orientation) {
                initVideoPlayer(context, orientation, snapshot.data);
                return Column(children: [
                  Container(height: barHeight, color: Colors.black),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: videoHeight,
                    child: Chewie(controller: _chewieController),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    NetworkImage(snapshot.data.cover.blurred))),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              VideoInfo(data: snapshot.data),
                              AuthorInfo(data: snapshot.data),
                              StreamBuilder<List<Item>>(
                                  stream: bloc.relateVideoStream,
                                  builder: (BuildContext context,
                                      AsyncSnapshot<List<Item>> snapshot) {
                                    return RelatedVideos(data: snapshot.data);
                                  })
                            ],
                          ),
                        )),
                  ),
                ]);
              }));
            }
          }),
    );
  }

  void initVideoPlayer(
      BuildContext context, Orientation orientation, Detail detail) {
    _videoPlayerController = VideoPlayerController.network(detail.playUrl);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: true,
      showControls: true,
      placeholder: orientation == Orientation.portrait
          ? CoverImageWidget(
              imageUrl: detail.cover.detail,
              width: double.infinity,
              height: double.infinity)
          : Container(color: Colors.black),
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
