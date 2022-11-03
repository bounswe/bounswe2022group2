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
        (_, int i) => i == 0
            ? _createButton(context)
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: context.height * .3),
                    child: _ChapterItem(
                      chapter: chapters[i - 1],
                      itemIndex: i - 1,
                      callback: (int itemIndex) =>
                          updateExpansions(itemIndex, keys),
                      expansionTileKey: keys[i - 1],
                    ),
                  ),
                  const CustomDivider(),
                ],
              ),
        childCount: chapters.length + 1,
      ),
    );
  }

  void updateExpansions(
      int index, List<GlobalKey<CustomExpansionTileState>> keys) {
    for (int i = 0; i < keys.length; i++) {
      final CustomExpansionTileState? state = keys[i].currentState;
      if (index == i) continue;
      state?.setExpansion(false);
    }
  }

  Widget _createButton(BuildContext context) => Padding(
        padding: EdgeInsets.only(
            top: context.height * 1.7,
            bottom: context.height * .3,
            left: context.width * 20,
            right: context.width * 20),
        child: ActionButton(
          icon: BaseIcon(context, Icons.add_outlined),
          text: TextKeys.createChapter,
          height: context.height * 5.3,
          backgroundColor: context.secondary,
          padding: EdgeInsets.symmetric(
              horizontal: context.responsiveSize * 2.8,
              vertical: context.responsiveSize * 1.4),
          onPressedError: context.read<LearningSpaceViewModel>().createChapter,
        ),
      );
}
