import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/model/learning_space_model.dart';
import '../../learning-space/view/learning_space_detail_screen.dart';
import '../../view-learning-spaces/view/view_all_list.dart';
import '/../../product/theme/light_theme.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../core/extensions/context/context_extensions.dart';
import '../../../core/widgets/divider/custom_divider.dart';
import '../../../product/language/language_keys.dart';
import '../../home/view/home_screen.dart';
import '../constants/search_screen_constants.dart';
import '../view-model/search_view_model.dart';

part 'components/search_widget.dart';

class SearchScreen extends BaseView<SearchViewModel> {
  const SearchScreen({Key? key})
      : super(
          builder: _builder,
          resizeToAvoidBottomInset: false,
          key: key,
        );

  static Widget _builder(BuildContext context) => DefaultTabController(
        length: SearchScreenConstants.tabKeys.length,
        child: NestedScrollView(
          headerSliverBuilder: _headerSliverBuilder,
          body: TabBarView(
            children: SearchScreenConstants.tabKeys
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

  static List<Widget> _slivers(BuildContext context, String tabKey) {
    final List<LearningSpace> listOfLearningSpaces =
        context.read<SearchViewModel>().resultLearningSpaces;
    return <Widget>[
      SliverOverlapInjector(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      ),
      SliverPadding(
        padding: EdgeInsets.symmetric(
            vertical: context.height * .6, horizontal: context.width * 2),
        sliver: tabKey == TextKeys.learnifies
            ? //ViewAllList(
            // listOfLearningSpaces:
            //   context.read<SearchViewModel>().resultLearningSpaces,
            //buttonExist: false)
            SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, int i) => GridView.builder(
                    physics: const ScrollPhysics(),
                    itemCount: 2,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) =>
                        const CoursePreview(
                            textKey: "Learning Space",
                            //ToDo after the LearningSpaces are initialized:
                            //listOfLearningSpaces[index].name ?? ''
                            participantNumber: 100
                            //ToDo after the LearningSpaces are initialized:
                            //listOfLearningSpaces[index].numParticipants ?? 0
                            ),
                  ),
                  childCount: 1,
                ),
              )
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
  }

  static List<Widget> _headerSliverBuilder(
          BuildContext context, bool innerBoxIsScrolled) =>
      <Widget>[
        SliverOverlapAbsorber(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          sliver: SliverAppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Column(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: SearchWidget(),
                  ),
                ],
              ),
            ),
            floating: true,
            pinned: true,
            expandedHeight: context.height * 18,
            forceElevated: innerBoxIsScrolled,
            bottom: TabBar(
              unselectedLabelColor: Colors.white30,
              indicatorColor: Colors.black,
              tabs: SearchScreenConstants.tabKeys
                  .map((String key) => Tab(text: context.tr(key)))
                  .toList(),
            ),
          ),
        ),
      ];

  static Widget exCourses(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GridView.builder(
            physics: const ScrollPhysics(),
            itemCount: 15,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) =>
                const CoursePreview(
                    textKey: "Learning Space",
                    //ToDo after the courses are initialized:
                    //listOfCourses[index].name ?? ''
                    participantNumber: 100
                    //ToDo after the courses are initialized:
                    //listOfCourses[index].numParticipants ?? 0
                    ),
          ),
        ],
      );
}
