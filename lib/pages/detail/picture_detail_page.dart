import 'package:cached_network_image/cached_network_image.dart';
import 'package:eyepetizer_flutter/blocs/bloc_provider.dart';
import 'package:eyepetizer_flutter/blocs/detail_bloc.dart';
import 'package:eyepetizer_flutter/model/content_data.dart';
import 'package:eyepetizer_flutter/model/detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:photo_view/photo_view.dart';

import 'widgets/picture_info.dart';

/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2021/1/20
///
class PictureDetailPage extends StatefulWidget {
  @override
  State createState() => PictureDetailPageState();
}

class PictureDetailPageState extends State<PictureDetailPage> {
  @override
  Widget build(BuildContext context) {
    ContentData contentData = ModalRoute.of(context).settings.arguments;
    DetailBloc bloc = BlocProvider.of<DetailBloc>(context);
    bloc.getDetailData(contentData.id, resourceType: contentData.resourceType);
    return StreamBuilder<Detail>(
        stream: bloc.detailStream,
        builder: (BuildContext context, AsyncSnapshot<Detail> snapshot) {
          if (snapshot.data == null) {
            return Container();
          } else {
            return Scaffold(
                backgroundColor: Colors.black,
                body: Column(children: [
                  Container(
                    color: Colors.black,
                    height: MediaQuery.of(context).padding.top,
                  ),
                  Expanded(
                    flex: 1,
                    child: Stack(children: [
                      Center(
                          child: Swiper(
                        loop: false,
                        onIndexChanged: (int index) {
                          bloc.addValue(index + 1);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return PhotoView(
                              imageProvider: CachedNetworkImageProvider(
                                  snapshot.data.urls[index])
                              // NetworkImage(snapshot.data.urls[index])
                              );
                        },
                        itemCount: snapshot.data.urls.length,
                      )),
                      Container(
                        width: double.infinity,
                        height: 80,
                        child: Stack(
                            alignment: AlignmentDirectional.centerStart,
                            children: [
                              Center(
                                  child: StreamBuilder(
                                      stream: bloc.indexStream,
                                      builder: (BuildContext context,
                                          AsyncSnapshot<int> snapshot2) {
                                        return Text(
                                            (snapshot2.data == null
                                                        ? 1
                                                        : snapshot2.data)
                                                    .toString() +
                                                "/" +
                                                snapshot.data.urls.length
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white));
                                      })),
                              Positioned(
                                left: 10,
                                child: Icon(Icons.arrow_drop_down_circle),
                              )
                            ]),
                      ),
                      Column(
                        children: [
                          Expanded(flex: 1, child: Spacer()),
                          PictureInfo(data: snapshot.data)
                        ],
                      )
                    ]),
                  )
                ]));
          }
        });
  }
}
