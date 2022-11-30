part of '../../learning_space_detail_screen.dart';

class EventItem extends StatelessWidget {
  const EventItem({
    required this.callback,
    required this.itemIndex,
    required this.expansionTileKey,
    Key? key,
  }) : super(key: key);
  final int itemIndex;
  final IndexCallback callback;
  final GlobalKey<CustomExpansionTileState> expansionTileKey;

  @override
  Widget build(BuildContext context) {
    final Event event = SelectorHelper<Event, LearningSpaceViewModel>()
        .listenValue(
            (LearningSpaceViewModel model) => model.events[itemIndex], context);
    return Theme(
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
        child: _expansionTile(context, event),
      ),
    );
  }

  Widget _expansionTile(BuildContext context, Event event) {
    final LearningSpaceViewModel viewModel =
        context.read<LearningSpaceViewModel>();
    return CustomExpansionTile(
      key: expansionTileKey,
      collapsedTextColor: context.inactiveTextColor,
      collapsedIconColor: context.inactiveTextColor,
      tilePadding: EdgeInsets.symmetric(horizontal: context.width * 3),
      childrenPadding: EdgeInsets.symmetric(horizontal: context.width * 3)
          .copyWith(bottom: context.height * 1.7),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child:
                BaseText('${itemIndex + 1}. ${event.title}', translated: false),
          ),
          BaseText(
              DateFormat('dd MMM - kk:mm').format(event.date ?? DateTime.now()),
              translated: false,
              style: context.bodyMedium),
        ],
      ),
      expandedCrossAxisAlignment: CrossAxisAlignment.center,
      expandedAlignment: Alignment.centerLeft,
      iconColor: context.primary,
      onExpansionChanged: (bool val) {
        if (val) {
          callback(itemIndex);
          viewModel.setDefault();
        }
      },
      children: <Widget>[
        MultiLineText(
          event.description ?? '',
          translated: false,
          maxLines: 1000,
          style: context.bodySmall,
        ),
        BaseText(TextKeys.eventDate),
        ChapterList.createEditButton(context, TextKeys.editEvent,
            Icons.edit_outlined, viewModel.editEvent),
      ],
    );
  }
}
