part of '../../learning_space_detail_screen.dart';

class EventItem extends StatelessWidget {
  const EventItem({
    required this.callback,
    required this.itemIndex,
    required this.expansionTileKey,
    required this.event,
    Key? key,
  }) : super(key: key);
  final int itemIndex;
  final IndexCallback callback;
  final GlobalKey<CustomExpansionTileState> expansionTileKey;
  final Event event;

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
          horizontalTitleGap: 0,
          dense: true,
          child: _expansionTile(context, event),
        ),
      );

  Widget _expansionTile(BuildContext context, Event event) {
    final LearningSpaceViewModel viewModel =
        context.read<LearningSpaceViewModel>();
    final User user =
        LocalManager.instance.getModel(const User(), StorageKeys.user);
    // final List<Map<String, dynamic>> userList =
    //     HomeViewModel.randomUsers.sublist(0, 13 + 15);
    // final List<String> userPhotos = userList
    //     // ignore: avoid_dynamic_calls
    //     .map((Map<String, dynamic> e) => e['picture']['medium'] as String)
    //     .toList();
    final bool isPassed = event.date?.isBefore(DateTime.now()) ?? false;
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
      collapsedBackgroundColor: isPassed ? Colors.red[300] : null,
      backgroundColor: isPassed ? Colors.red[300] : null,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      expandedAlignment: Alignment.centerLeft,
      iconColor: context.primary,
      onExpansionChanged: (bool val) {
        if (val) {
          callback(itemIndex);
        }
      },
      children: <Widget>[
        Row(
          children: <Widget>[
            const CircleAvatar(
                foregroundColor: Colors.white,
                foregroundImage: AssetImage(IconKeys.person),
                radius: 12),
            context.sizedW(2),
            // ignore: avoid_dynamic_calls
            BaseText('${context.tr(TextKeys.creator)}: ${event.eventCreator}',
                translated: false,
                style: context.bodySmall,
                onClick: () async => NavigationManager.instance.navigateToPage(
                      path: NavigationConstants.othersProfile,
                      data: <String, String?>{'username': event.eventCreator},
                    ))
          ],
        ),
        context.sizedH(1),
        MultiLineText(
          event.description ?? '',
          translated: false,
          maxLines: 1000,
          textAlign: TextAlign.start,
          style: context.bodySmall,
        ),
        context.sizedH(1.2),
        _infoText(
            context,
            TextKeys.eventDate,
            DateFormat('dd MMMM yyyy - kk:mm')
                .format(event.date ?? DateTime.now())),
        context.sizedH(.8),
        _infoText(
            context, TextKeys.eventDuration, '${event.duration?.minsToString}'),
        context.sizedH(.8),
        GestureDetector(
          onTap: event.participants.isEmpty
              ? null
              : () async {
                  final String? selectedUser = await DialogBuilder(context)
                      .singleSelectDialog<String>(
                          TextKeys.eventParticipants, event.participants, null);
                  await NavigationManager.instance.navigateToPage(
                      path: NavigationConstants.othersProfile,
                      data: <String, String?>{
                        'username': selectedUser,
                      });
                },
          child: _infoText(
            context,
            TextKeys.eventParticipants,
            '',
            customWidget: _participantsRow(context),
            lastChild: BaseText(
              '${event.participants.length}/${event.participationLimit ?? '∞'}',
              translated: false,
              style: context.bodySmall,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: context.height * 1.8),
          child: SizedBox(
            height: context.height * 22,
            child: EventMap(location: event.geoLocation ?? const GeoLocation()),
          ),
        ),
        if (event.eventCreator != user.id)
          PostList.createEditButton(
              context,
              isPassed ? TextKeys.passedEvent : TextKeys.attendEvent,
              isPassed ? Icons.timer_off_outlined : Icons.join_inner_outlined,
              isPassed
                  ? null
                  : () {
                      viewModel.attendEvent(event.id ?? "");
                    }),
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

  Widget _participantsRow(BuildContext context) {
    final int numOfPhotos = min(event.participants.length, 5);
    return Padding(
      padding: EdgeInsets.only(left: context.width * 3),
      child: Row(
        children: List<Widget>.generate(
          numOfPhotos + 1,
          (int i) => Align(
            widthFactor: 0.8,
            child: CircledText(
              text: i == numOfPhotos
                  ? '+${event.participants.length - numOfPhotos}'
                  : event.participants[i][0],
              textStyle: context.bodyMedium
                  .copyWith(color: ColorHelpers.darkRandomColor),
            ),
          ),
        ),
      ),
    );
  }
}
