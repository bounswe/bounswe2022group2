part of '../../learning_space_detail_screen.dart';

class PostList extends StatelessWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Tuple2<int, List<GlobalKey<CustomExpansionTileState>>> tuple =
        SelectorHelper<Tuple2<int, List<GlobalKey<CustomExpansionTileState>>>,
                LearningSpaceViewModel>()
            .listenValue(
                (LearningSpaceViewModel model) =>
                    Tuple2<int, List<GlobalKey<CustomExpansionTileState>>>(
                        model.posts.length, model.expansionTileKeys),
                context);
    final List<GlobalKey<CustomExpansionTileState>> keys = tuple.item2;
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, int i) => i == 0
            ? createEditButton(
                context,
                TextKeys.createPost,
                Icons.add_outlined,
                context.read<LearningSpaceViewModel>().createPost,
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: context.height * .3),
                    child: PostItem(
                      itemIndex: i - 1,
                      callback: (int itemIndex) =>
                          updateExpansions(itemIndex, keys),
                      expansionTileKey: keys[i - 1],
                    ),
                  ),
                  const CustomDivider(),
                ],
              ),
        childCount: tuple.item1 + 1,
      ),
    );
  }

  static void updateExpansions(
      int index, List<GlobalKey<CustomExpansionTileState>> keys) {
    for (int i = 0; i < keys.length; i++) {
      final CustomExpansionTileState? state = keys[i].currentState;
      if (index == i) continue;
      state?.setExpansion(false);
    }
  }

  static Widget createEditButton(BuildContext context, String textKey,
          IconData icon, ErrorHelper? callback,
          {bool isEdit = false}) =>
      Padding(
        padding: EdgeInsets.only(
            top: context.height * 1.7,
            bottom: context.height * .3,
            left: context.width * 20,
            right: context.width * 20),
        child: ActionButton(
          icon: BaseIcon(context, icon),
          text: textKey,
          height: context.height * 4.8,
          backgroundColor: context.secondary,
          padding: EdgeInsets.symmetric(
              horizontal: context.responsiveSize * 2.8,
              vertical: context.responsiveSize * 1.4),
          isActive: callback != null,
          onPressedError: () async {
            if (callback != null) {
              await NavigationManager.instance.navigateToPage(
                  path: NavigationConstants.addEditPost,
                  data: <String, dynamic>{'isAdd': !isEdit});
              return await callback();
            }
            return null;
          },
        ),
      );
}
