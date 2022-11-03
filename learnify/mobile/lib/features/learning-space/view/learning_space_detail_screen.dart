import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../core/extensions/context/context_extensions.dart';
import '../../../core/extensions/context/theme_extensions.dart';
import '../../../core/helpers/selector_helper.dart';
import '../../../core/widgets/divider/custom_divider.dart';
import '../../../core/widgets/list/custom_expansion_tile.dart';
import '../../../core/widgets/text/multiline_text.dart';
import '../../../product/constants/icon_keys.dart';
import '../constants/learning_space_constants.dart';
import '../models/chapter_model.dart';
import '../view-model/learning_space_view_model.dart';

part 'components/chapter/chapter_item.dart';
part 'components/chapter/chapter_list.dart';

class LearningSpaceDetailScreen extends BaseView<LearningSpaceViewModel>
    with LearningSpaceConstants {
  const LearningSpaceDetailScreen({Key? key})
      : super(builder: _builder, key: key);

  static Widget _builder(BuildContext context) => DefaultTabController(
        length: LearningSpaceConstants.tabKeys.length,
        child: NestedScrollView(
          headerSliverBuilder: _headerSliverBuilder,
          body: TabBarView(
            children: LearningSpaceConstants.tabKeys
                .map(
                  (String key) => SafeArea(
                    top: false,
                    bottom: false,
                    child: Builder(
                      builder: (BuildContext context) => CustomScrollView(
                        key: PageStorageKey<String>(key),
                        slivers: _slivers(context),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      );

  static List<Widget> _slivers(BuildContext context) => <Widget>[
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(
              vertical: context.height * .6, horizontal: context.width * 2),
          sliver: const _ChapterList(),
        ),
      ];

  static List<Widget> _headerSliverBuilder(
          BuildContext context, bool innerBoxIsScrolled) =>
      <Widget>[
        SliverOverlapAbsorber(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          sliver: SliverAppBar(
            flexibleSpace: Column(
              children: <Widget>[
                const Text('Books'),
                Image.asset(IconKeys.learnIllustration,
                    width: context.width * 45),
              ],
            ),
            pinned: true,
            expandedHeight: context.height * 42,
            forceElevated: innerBoxIsScrolled,
            bottom: TabBar(
              tabs: LearningSpaceConstants.tabKeys
                  .map((String key) => Tab(text: context.tr(key)))
                  .toList(),
            ),
          ),
        ),
      ];
}
