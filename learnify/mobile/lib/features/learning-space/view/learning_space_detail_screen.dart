import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:measured_size/measured_size.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../core/constants/main_type_definitions.dart';
import '../../../core/extensions/context/context_extensions.dart';
import '../../../core/extensions/context/theme_extensions.dart';
import '../../../core/helpers/selector_helper.dart';
import '../../../core/managers/navigation/navigation_manager.dart';
import '../../../core/widgets/base-icon/base_icon.dart';
import '../../../core/widgets/buttons/action_button.dart';
import '../../../core/widgets/dialog/dialog_builder.dart';
import '../../../core/widgets/divider/custom_divider.dart';
import '../../../core/widgets/image/annotatable_image.dart';
import '../../../core/widgets/image/custom_network_image.dart';
import '../../../core/widgets/image/image_painter.dart';
import '../../../core/widgets/list/custom_expansion_tile.dart';
import '../../../core/widgets/text/annotatable/annotatable_text.dart';
import '../../../core/widgets/text/base_text.dart';
import '../../../core/widgets/text/multiline_text.dart';
import '../../../product/constants/icon_keys.dart';
import '../../../product/constants/navigation_constants.dart';
import '../../../product/language/language_keys.dart';
import '../constants/learning_space_constants.dart';
import '../models/annotation_model.dart';
import '../models/chapter_model.dart';
import '../view-model/learning_space_view_model.dart';

part 'components/chapter/chapter_item.dart';
part 'components/chapter/chapter_list.dart';

class LearningSpaceDetailScreen extends BaseView<LearningSpaceViewModel>
    with LearningSpaceConstants {
  const LearningSpaceDetailScreen({Key? key})
      : super(
          builder: _builder,
          resizeToAvoidBottomInset: false,
          key: key,
        );

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
                        slivers: _slivers(context, key),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      );

  static List<Widget> _slivers(BuildContext context, String tabKey) => <Widget>[
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(
              vertical: context.height * .6, horizontal: context.width * 2),
          sliver: tabKey == TextKeys.chapters
              ? const ChapterList()
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, int i) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: context.height * .3),
                            child: const Text('i')),
                        const CustomDivider(),
                      ],
                    ),
                    childCount: 12,
                  ),
                ),
        ),
      ];

  static List<Widget> _headerSliverBuilder(
          BuildContext context, bool innerBoxIsScrolled) =>
      <Widget>[MySliverOverlayAbsorber(innerBoxIsScrolled: innerBoxIsScrolled)];

  static Widget _tagWidget(BuildContext context, List<String> tagList) => Wrap(
      runSpacing: 5,
      spacing: 5,
      children: tagList.map((String tag) => CustomizedChip(tag: tag)).toList());
}

class MySliverOverlayAbsorber extends StatefulWidget {
  const MySliverOverlayAbsorber({required this.innerBoxIsScrolled});
  final bool innerBoxIsScrolled;
  @override
  State<MySliverOverlayAbsorber> createState() =>
      _MySliverOverlayAbsorberState();
}

class _MySliverOverlayAbsorberState extends State<MySliverOverlayAbsorber> {
  late Size wsize = Size.fromHeight(context.responsiveSize * 2);

  @override
  Widget build(BuildContext context) => SliverOverlapAbsorber(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        sliver: SliverAppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            background: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset(IconKeys.learnIllustration,
                    width: context.width * 60),
                context.sizedH(1),
                Container(
                  padding: const EdgeInsets.all(15),
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "Placeholder Learning Space",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 18),
                      ),
                      context.sizedH(2),
                      const Text(
                        "This is a placeholder summary of the placeholder learning space. After implementing the endpoint, real description of the learning space will take place here.",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      context.sizedH(1),
                      MeasuredSize(
                        onChange: (Size size) {
                          setState(() {
                            wsize = size;
                          });
                        },
                        child: LearningSpaceDetailScreen._tagWidget(context, [
                          "flutter",
                          "react.js",
                          "node.js",
                          "mongodb",
                          "aws",
                          "docker",
                          "git",
                          "jenkins",
                          "flutter",
                          "react.js",
                          "node.js",
                          "mongodb",
                          "aws",
                          "docker",
                          "git",
                          "jenkins"
                        ]),
                      ),
                      context.sizedH(1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          Expanded(
                            child: Text(
                              "Created by: placeholder_username",
                              textAlign: TextAlign.left,
                              style: TextStyle(overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          Icon(Icons.people_alt_outlined, size: 20),
                          Text("100")
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          floating: true,
          pinned: true,
          expandedHeight: context.height * 46 + wsize.height,
          forceElevated: widget.innerBoxIsScrolled,
          bottom: ColoredTabBar(
            color: context.primary,
            tabBar: TabBar(
              tabs: LearningSpaceConstants.tabKeys
                  .map((String key) => Tab(text: context.tr(key)))
                  .toList(),
            ),
          ),
        ),
      );
}

class ColoredTabBar extends Container implements PreferredSizeWidget {
  ColoredTabBar({required this.color, required this.tabBar});

  @override
  final Color color;
  final TabBar tabBar;

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) => ColoredBox(
        color: color,
        child: tabBar,
      );
}

class CustomizedChip extends StatelessWidget {
  const CustomizedChip({required this.tag, Key? key}) : super(key: key);
  final String tag;

  @override
  Widget build(BuildContext context) => Chip(
        label: Text(tag),
        labelPadding:
            EdgeInsets.symmetric(horizontal: context.responsiveSize * 1.4),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        labelStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 12),
        backgroundColor: context.primary,
      );
}
