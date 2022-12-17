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
        horizontalTitleGap: 0,
        dense: true,
        child: _expansionTile(context, event),
      ),
    );
  }

  Widget _expansionTile(BuildContext context, Event event) {
    final LearningSpaceViewModel viewModel =
        context.read<LearningSpaceViewModel>();
    final List<Map<String, dynamic>> userList = context
        .read<HomeViewModel>()
        .randomUsers
        .sublist(0, Random().nextInt(34) + 15);
    final List<String> userPhotos = userList
        // ignore: avoid_dynamic_calls
        .map((Map<String, dynamic> e) => e['picture']['medium'] as String)
        .toList();
    final Map<String, dynamic> userName = userList.last['name'];
    final bool isPassed = event.date.isBefore(DateTime.now());
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
      collapsedBackgroundColor: isPassed ? Colors.red[300] : null,
      backgroundColor: isPassed ? Colors.red[300] : null,
      expandedCrossAxisAlignment: CrossAxisAlignment.center,
      expandedAlignment: Alignment.centerLeft,
      iconColor: context.primary,
      onExpansionChanged: (bool val) {
        if (val) {
          callback(itemIndex);
        }
      },
      children: <Widget>[
        Row(children: <Widget>[
          CircleAvatar(
              foregroundImage: NetworkImage(userPhotos.last), radius: 14),
          context.sizedW(2),
          // ignore: avoid_dynamic_calls
          BaseText(userName['first'] + ' ' + userName['last'],
              translated: false, style: context.bodySmall)
        ]),
        context.sizedH(1),
        MultiLineText(
          event.description ?? '',
          translated: false,
          maxLines: 1000,
          style: context.bodySmall,
        ),
        context.sizedH(1.2),
        _infoText(context, TextKeys.eventDate,
            DateFormat('dd MMMM yyyy - kk:mm').format(event.date)),
        context.sizedH(.8),
        _infoText(
            context, TextKeys.eventDuration, '${event.duration?.minsToString}'),
        context.sizedH(.8),
        _infoText(
          context,
          TextKeys.eventParticipants,
          '',
          customWidget: _participantsRow(context, userPhotos),
          lastChild: BaseText(
            '${userPhotos.length}/${event.participationLimit}',
            translated: false,
            style: context.bodySmall,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: context.height * 1.8),
          child: SizedBox(
            height: context.height * 22,
            child: _EventMap(location: GeoLocation.dummy()),
          ),
        ),
        PostList.createEditButton(
            context,
            isPassed ? TextKeys.passedEvent : TextKeys.editEvent,
            isPassed ? Icons.timer_off_outlined : Icons.edit_outlined,
            isPassed ? null : viewModel.editEvent),
      ],
    );
  }

  Widget _infoText(BuildContext context, String key, String value,
          {Widget? customWidget, Widget? lastChild}) =>
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
          if (lastChild != null) lastChild,
        ],
      );

  Widget _participantsRow(BuildContext context, List<String> userPhotos) {
    final int numOfPhotos = min(5, userPhotos.length);
    return Padding(
      padding: EdgeInsets.only(left: context.width * 3),
      child: Row(
        children: List<Widget>.generate(
          numOfPhotos + 1,
          (int i) => Align(
            widthFactor: 0.8,
            child: CircleAvatar(
              backgroundColor: context.primary,
              foregroundImage:
                  i == numOfPhotos ? null : NetworkImage(userPhotos[i]),
              radius: 14,
              child: i == numOfPhotos
                  ? BaseText('+${userPhotos.length - numOfPhotos}',
                      translated: false,
                      color: Colors.white,
                      style: context.labelLarge)
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
