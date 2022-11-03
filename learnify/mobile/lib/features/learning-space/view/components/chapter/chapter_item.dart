part of '../../learning_space_detail_screen.dart';

class _ChapterItem extends StatelessWidget {
  const _ChapterItem({
    required this.chapter,
    required this.callback,
    required this.itemIndex,
    required this.expansionTileKey,
    Key? key,
  }) : super(key: key);
  final Chapter chapter;
  final int itemIndex;
  final VoidCallback callback;
  final GlobalKey<CustomExpansionTileState> expansionTileKey;

  @override
  Widget build(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          highlightColor: context.primary.withOpacity(.15),
          hoverColor: context.primary,
        ),
        child: ListTileTheme(
          contentPadding: EdgeInsets.zero,
          minLeadingWidth: 0,
          minVerticalPadding: 0,
          dense: true,
          child: _expansionTile(context),
        ),
      );

  Widget _expansionTile(BuildContext context) => CustomExpansionTile(
        key: expansionTileKey,
        collapsedTextColor: context.inactiveTextColor,
        collapsedIconColor: context.inactiveTextColor,
        tilePadding: EdgeInsets.symmetric(horizontal: context.width * 3),
        childrenPadding: EdgeInsets.symmetric(
            horizontal: context.width * 3, vertical: context.height * .4),
        title: MultiLineText('${itemIndex + 1}. ${chapter.title}',
            translated: false),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        expandedAlignment: Alignment.centerLeft,
        iconColor: context.primary,
        onExpansionChanged: (bool val) {
          if (val) {
            callback();
            context.read<LearningSpaceViewModel>().setDefault();
          }
        },
        children: const <Widget>[
          Text('asdasd'),
        ],
      );
}
