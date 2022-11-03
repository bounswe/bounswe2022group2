part of '../../learning_space_detail_screen.dart';

class _ChapterList extends StatelessWidget {
  const _ChapterList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Tuple2<List<Chapter>,
        List<GlobalKey<CustomExpansionTileState>>> tuple = SelectorHelper<
            Tuple2<List<Chapter>, List<GlobalKey<CustomExpansionTileState>>>,
            LearningSpaceViewModel>()
        .listenValue(
            (LearningSpaceViewModel model) => Tuple2<List<Chapter>,
                    List<GlobalKey<CustomExpansionTileState>>>(
                model.chapters, model.expansionTileKeys),
            context);
    final List<Chapter> chapters = tuple.item1;
    final List<GlobalKey<CustomExpansionTileState>> keys = tuple.item2;
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, int i) => Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: context.height * .3),
              child: _ChapterItem(
                chapter: chapters[i],
                itemIndex: i,
                callback: () => updateExpansions(i, keys),
                expansionTileKey: keys[i],
              ),
            ),
            const CustomDivider(),
          ],
        ),
        childCount: chapters.length,
      ),
    );
  }

  void updateExpansions(
      int index, List<GlobalKey<CustomExpansionTileState>> keys) {
    for (int i = 0; i < keys.length; i++) {
      final CustomExpansionTileState? state = keys[i].currentState;
      if (index == i || !(state?.isExpanded ?? true)) continue;
      state?.handleTap(callback: false);
    }
  }
}
