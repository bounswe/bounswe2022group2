import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../core/constants/main_type_definitions.dart';
import '../../../core/extensions/context/context_extensions.dart';
import '../../../core/extensions/context/theme_extensions.dart';
import '../../../core/extensions/number/number_extensions.dart';
import '../../../core/helpers/color_helpers.dart';
import '../../../core/helpers/selector_helper.dart';
import '../../../core/managers/local/local_manager.dart';
import '../../../core/managers/navigation/navigation_manager.dart';
import '../../../core/widgets/base-icon/base_icon.dart';
import '../../../core/widgets/buttons/action_button.dart';
import '../../../core/widgets/dialog/dialog_builder.dart';
import '../../../core/widgets/divider/custom_divider.dart';
import '../../../core/widgets/image/annotatable_image.dart';
import '../../../core/widgets/image/image_painter.dart';
import '../../../core/widgets/indicators/custom_loading_indicator.dart';
import '../../../core/widgets/list/custom_expansion_tile.dart';
import '../../../core/widgets/measured_size.dart';
import '../../../core/widgets/text/annotatable/annotatable_text.dart';
import '../../../core/widgets/text/base_text.dart';
import '../../../core/widgets/text/circled_text.dart';
import '../../../core/widgets/text/multiline_text.dart';
import '../../../product/constants/icon_keys.dart';
import '../../../product/constants/navigation_constants.dart';
import '../../../product/constants/storage_keys.dart';
import '../../../product/language/language_keys.dart';
import '../../auth/verification/model/user_model.dart';
import '../../home/view-model/home_view_model.dart';
import '../constants/learning_space_constants.dart';
import '../models/annotation/annotation_model.dart';
import '../models/event/event.dart';
import '../models/geolocation/geolocation_model.dart';
import '../models/learning_space_model.dart';
import '../models/post_model.dart';
import '../view-model/learning_space_view_model.dart';
import 'annotations_screen.dart';

part 'components/events/event_item.dart';
part 'components/events/event_map.dart';
part 'components/events/events_list.dart';
part 'components/forum_list.dart';
part 'components/post/post_item.dart';
part 'components/post/post_list.dart';

class LearningSpaceDetailScreen extends BaseView<LearningSpaceViewModel>
    with LearningSpaceConstants {
  LearningSpaceDetailScreen(
      {required LearningSpace? learningSpace, int initialIndex = 0, Key? key})
      : super(
          builder: (BuildContext context) =>
              _builder(context, learningSpace, initialIndex),
          voidInit: (BuildContext context) => context
              .read<LearningSpaceViewModel>()
              .setLearningSpace(learningSpace),
          resizeToAvoidBottomInset: false,
          key: key,
        );

  static Widget _builder(BuildContext context, LearningSpace? learningSpace,
          int initialIndex) =>
      DefaultTabController(
        initialIndex: initialIndex,
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
            sliver: tabKey == TextKeys.posts
                ? const PostList()
                : (tabKey == TextKeys.events
                    ? const EventsList()
                    : const ForumList())),
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
  const MySliverOverlayAbsorber({required this.innerBoxIsScrolled, super.key});
  final bool innerBoxIsScrolled;
  @override
  State<MySliverOverlayAbsorber> createState() =>
      _MySliverOverlayAbsorberState();
}

class _MySliverOverlayAbsorberState extends State<MySliverOverlayAbsorber> {
  late Size wsize = Size.fromHeight(context.responsiveSize * 2);
  late Size iconSize = Size.fromHeight(context.responsiveSize * 2);

  @override
  Widget build(BuildContext context) {
    final LearningSpace? tempLearningSpace =
        SelectorHelper<LearningSpace?, LearningSpaceViewModel>().listenValue(
            (LearningSpaceViewModel model) => model.learningSpace, context);
    return SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      sliver: SliverAppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          background: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                MeasuredSize(
                  onChange: (Size size) {
                    if (!mounted) return;
                    setState(() {
                      iconSize = size;
                    });
                  },
                  child: Image.asset(
                      IconKeys.lsIcons[tempLearningSpace?.iconId ?? 0],
                      width: context.width * 60),
                ),
                context.sizedH(1),
                MeasuredSize(
                    onChange: (Size size) {
                      if (!mounted) return;
                      setState(() {
                        wsize = size;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      width: double.infinity,
                      color: context.isDark ? Colors.black54 : Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(
                                width: context.width * 65,
                                child: Text(
                                  softWrap: true,
                                  tempLearningSpace?.title ??
                                      "Placeholder Learning Space",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                                onPressed: context
                                        .read<HomeViewModel>()
                                        .getIsEnrolled(tempLearningSpace?.title)
                                    ? () {}
                                    : () async {
                                        final LearningSpaceViewModel viewModel =
                                            context
                                                .read<LearningSpaceViewModel>();
                                        final HomeViewModel homeModel =
                                            context.read<HomeViewModel>();
                                        final String? res = await viewModel
                                            .enrollLearningSpace();
                                        if (res != null) return;
                                        homeModel.addToTakenLearningSpaces(
                                            viewModel.learningSpace);
                                        homeModel
                                            .updateLs(viewModel.learningSpace);
                                      },
                                child: SelectorHelper<bool, HomeViewModel>()
                                    .builder(
                                        (_, HomeViewModel model) =>
                                            model.getIsEnrolled(
                                                tempLearningSpace?.title),
                                        (_, bool val, __) => val
                                            ? const BaseText(
                                                TextKeys.enrolled,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            : const BaseText(
                                                TextKeys.enroll,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                              )
                            ],
                          ),
                          context.sizedH(.8),
                          MultiLineText(
                            tempLearningSpace?.description ??
                                "This is a placeholder summary of the placeholder learning space. After implementing the endpoint, real description of the learning space will take place here.",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                            translated: false,
                            maxLines: 15,
                          ),
                          context.sizedH(1),
                          LearningSpaceDetailScreen._tagWidget(
                              context,
                              tempLearningSpace?.categories ??
                                  [
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
                          context.sizedH(1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: BaseText(
                                  '${context.tr(TextKeys.creator)}: ${tempLearningSpace?.creator}',
                                  textAlign: TextAlign.start,
                                  translated: false,
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                              const Icon(Icons.people_alt_outlined, size: 20),
                              Text(tempLearningSpace?.numParticipants
                                      .toString() ??
                                  "100")
                            ],
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
        floating: true,
        pinned: true,
        expandedHeight: context.height * 8 + iconSize.height + wsize.height,
        forceElevated: widget.innerBoxIsScrolled,
        bottom: ColoredTabBar(
          color: context.primary,
          tabBar: TabBar(
            onTap: (int val) async =>
                context.read<LearningSpaceViewModel>().getEvents(),
            tabs: LearningSpaceConstants.tabKeys
                .map((String key) => Tab(text: context.tr(key)))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class ColoredTabBar extends Container implements PreferredSizeWidget {
  ColoredTabBar({
    required this.color,
    required this.tabBar,
    super.key,
  });

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
