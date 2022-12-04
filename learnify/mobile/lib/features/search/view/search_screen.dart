import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/../../product/theme/light_theme.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../core/extensions/context/context_extensions.dart';
import '../../../core/helpers/selector_helper.dart';
import '../../../product/language/language_keys.dart';
import '../../home/view/home_screen.dart';
import '../../learning-space/models/learning_space_model.dart';
import '../constants/search_screen_constants.dart';
import '../../../core/extensions/context/context_extensions.dart';
import '../../../product/constants/icon_keys.dart';
import '../../../product/theme/dark_theme.dart';
import '../view-model/search_view_model.dart';

part 'components/search_bar_widget.dart';
part 'components/search_result_widget.dart';

part '../components/user_preview.dart';

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

  static List<Widget> _slivers(BuildContext context, String tabKey) => <Widget>[
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverPadding(
            padding: EdgeInsets.symmetric(
                vertical: context.height * .6, horizontal: context.width * 2),
            sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
              (_, int i) => tabKey == TextKeys.learningSpaces
                  ? const SearchResultWidget()
                  : const Center(
                      child: Text("Static user search will be added"),
                    ),
              childCount: 1,
            ))),
      ];

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
                    child: SearchBarWidget(),
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
}
