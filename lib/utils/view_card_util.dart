import 'package:eyepetizer_flutter/model/base_list_data.dart';
import 'package:eyepetizer_flutter/model/item.dart';
import 'package:eyepetizer_flutter/pages/community/widgets/staggered_view.dart';
import 'package:eyepetizer_flutter/pages/home/discover_page.dart';
import 'package:eyepetizer_flutter/pages/home/widgets/banner_card.dart';
import 'package:eyepetizer_flutter/pages/home/widgets/horizontal_scroll_card.dart';
import 'package:eyepetizer_flutter/pages/home/widgets/column_card.dart';
import 'package:eyepetizer_flutter/pages/home/widgets/cover_card.dart';
import 'package:eyepetizer_flutter/pages/home/widgets/hot_classification_card.dart';
import 'package:eyepetizer_flutter/pages/home/widgets/image_card.dart';
import 'package:eyepetizer_flutter/pages/home/widgets/normal_card.dart';
import 'package:eyepetizer_flutter/pages/home/widgets/title_card.dart';
import 'package:eyepetizer_flutter/pages/home/widgets/video_small_card.dart';
import 'package:eyepetizer_flutter/pages/mine/widgets/auto_play_product_video_card.dart';
import 'package:eyepetizer_flutter/pages/mine/widgets/horizontal_scroll_collection_card.dart';
import 'package:eyepetizer_flutter/pages/home/widgets/theme_card.dart';
import 'package:flutter/cupertino.dart';

/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/23
///
class ViewCardUtil {
  static Widget getViewCard(Item item, {tag, itemList}) {
    switch (item.type) {
      case "textCard":
        return TitleCard(tag: DiscoverPage.TAG, title: item.data.text);
      case "followCard":
        return NormalCard(data: item.data);
      case "pictureFollowCard":
        return CoverCard(data: item.data);
      case "horizontalScrollCard":
        return HorizontalScrollCard(data: item, tag: tag);
      case "videoCollectionOfHorizontalScrollCard":
        return HorizontalScrollCollectionCard(data: item);
      case "specialSquareCardCollection":
        return HotClassificationCard(data: item);
      case "columnCardList":
        return ColumnCard(data: item);
      case "columnCardList":
        return ColumnCard(data: item);
      // case "autoPlayVideoAd":
      //   return AutoPlayVideoCard(data: itemData);
      case "autoPlayFollowCard":
        return AutoPlayProductsVideoCard(data: item);
      case "banner3":
        return BannerCard(type: item.type, data: item.data);
      case "banner":
        return ImageCard(url: item.data.image);
      case "videoSmallCard":
        return VideoSmallCard(width: 180, height: 110, data: item);
      case "briefCard":
        return ThemeCard(data: item);
      case "communityColumnsCard":
        return StaggeredViewCard(list: itemList);
      default:
        return Text(item.type);
    }
  }
}
