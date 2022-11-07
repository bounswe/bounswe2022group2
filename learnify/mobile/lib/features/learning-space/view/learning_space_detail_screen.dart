import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:measured_size/measured_size.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../core/constants/main_type_definitions.dart';
import '../../../core/extensions/context/context_extensions.dart';
import '../../../core/extensions/context/theme_extensions.dart';
import '../../../core/helpers/selector_helper.dart';
import '../../../core/widgets/base-icon/base_icon.dart';
import '../../../core/widgets/buttons/action_button.dart';
import '../../../core/widgets/divider/custom_divider.dart';
import '../../../core/widgets/image/custom_network_image.dart';
import '../../../core/widgets/list/custom_expansion_tile.dart';
import '../../../core/widgets/text/multiline_text.dart';
import '../../../product/constants/icon_keys.dart';
import '../../../product/language/language_keys.dart';
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
      children: tagList
          .map((tag) => Chip(
                label: Text(tag),
                labelPadding: EdgeInsets.zero,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 12),
                backgroundColor: context.primary,
              ))
          .toList());
}

class MySliverOverlayAbsorber extends StatefulWidget {
  final bool innerBoxIsScrolled;
  MySliverOverlayAbsorber({required this.innerBoxIsScrolled});
  State<MySliverOverlayAbsorber> createState() =>
      _MySliverOverlayAbsorberState();
}

class _MySliverOverlayAbsorberState extends State<MySliverOverlayAbsorber> {
  Size wsize = Size.zero;

  Widget build(BuildContext) => SliverOverlapAbsorber(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        sliver: SliverAppBar(
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            background: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back)),
                      IconButton(
                          onPressed: () {
                            //TODO: Navigate to edit learning space screen
                          },
                          icon: Icon(Icons.edit)),
                    ]),
                Image.asset(IconKeys.learnIllustration,
                    width: context.width * 60),
                context.sizedH(1),
                Container(
                  padding: EdgeInsets.all(15),
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Placeholder Learning Space",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 18),
                      ),
                      context.sizedH(2),
                      Text(
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
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Created by: placeholder_username",
                              textAlign: TextAlign.left,
                              style: TextStyle(overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          Icon(Icons.people_alt_outlined, size: 20),
                          Text(
                            "100",
                          )
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
          expandedHeight: context.height * 55 + wsize.height,
          forceElevated: widget.innerBoxIsScrolled,
          bottom: TabBar(
            tabs: LearningSpaceConstants.tabKeys
                .map((String key) => Tab(text: context.tr(key)))
                .toList(),
          ),
        ),
      );
}
