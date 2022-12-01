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
          BaseText(DateFormat('dd MMM - kk:mm').format(event.date),
              translated: false, style: context.bodyMedium),
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
        context.sizedH(1.2),
        _infoText(context, TextKeys.eventDate,
            DateFormat('dd MMMM yyyy - kk:mm').format(event.date)),
        context.sizedH(.9),
        _infoText(
            context, TextKeys.eventDuration, '${event.duration?.minsToString}'),
        context.sizedH(.9),
        _infoText(context, TextKeys.eventParticipants, '',
            customWidget: _participantsRow(context)),
        ChapterList.createEditButton(context, TextKeys.editEvent,
            Icons.edit_outlined, viewModel.editEvent),
      ],
    );
  }

  Widget _participantsRow(BuildContext context) {
    final List<String> userPhotos = context
        .read<HomeViewModel>()
        .randomUsers
        // ignore: avoid_dynamic_calls
        .map((Map<String, dynamic> e) => e['picture']['medium'] as String)
        .toList();
    final int participantNumber = Random().nextInt(4) + 2;
    return Row(
      children: List<Widget>.generate(
        participantNumber + 1,
        (int i) => Align(
          widthFactor: 0.8,
          child: ClipOval(
            child: Container(
              color: Colors.white,
              child: CircleAvatar(
                backgroundColor: context.primary,
                foregroundImage:
                    i == participantNumber ? null : NetworkImage(userPhotos[i]),
                radius: 14,
                child: i == participantNumber
                    ? BaseText('+${userPhotos.length - participantNumber}',
                        translated: false,
                        color: Colors.white,
                        style: context.labelLarge)
                    : null,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoText(BuildContext context, String key, String value,
          {Widget? customWidget}) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: BaseText(
              '${context.tr(key)}:',
              translated: false,
              style: context.bodySmall,
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            flex: 2,
            child: customWidget ??
                BaseText(
                  value,
                  style: context.bodySmall,
                  translated: false,
                  textAlign: TextAlign.start,
                ),
          ),
        ],
      );
}
