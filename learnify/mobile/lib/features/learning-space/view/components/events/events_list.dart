part of '../../learning_space_detail_screen.dart';

class EventsList extends StatelessWidget {
  const EventsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LearningSpaceViewModel viewModel =
        context.read<LearningSpaceViewModel>();
    final Tuple2<List<Event>?, List<GlobalKey<CustomExpansionTileState>>>
        tuple = SelectorHelper<
                Tuple2<List<Event>?, List<GlobalKey<CustomExpansionTileState>>>,
                LearningSpaceViewModel>()
            .listenValue(
                (LearningSpaceViewModel model) => Tuple2<List<Event>?,
                        List<GlobalKey<CustomExpansionTileState>>>(
                    model.eventsOfLs, model.eventsExpansionTileKeys),
                context);
    if (tuple.item1 != null) {
      tuple.item1!
        ..sort((Event e1, Event e2) =>
            e1.date?.compareTo(e2.date ?? DateTime.now()) ?? 0)
        ..sort((Event e1, Event e2) =>
            e1.date?.isBefore(DateTime.now()) ?? false ? 1 : -1);
    }
    final List<GlobalKey<CustomExpansionTileState>> keys = tuple.item2;
    return SliverList(
      key: const PageStorageKey<String>('EVENTS_LIST'),
      delegate: SliverChildBuilderDelegate(
        (_, int i) => i == 0
            ? PostList.createEditButton(context, TextKeys.createEvent,
                Icons.event_available_outlined, viewModel.createEvent)
            : tuple.item1 == null
                ? Padding(
                    padding: EdgeInsets.only(top: context.height * 2.5),
                    child: CustomLoadingIndicator(context,
                        size: context.width * 15),
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: context.height * .3),
                        child: EventItem(
                          itemIndex: i - 1,
                          event: tuple.item1![i - 1],
                          callback: (int itemIndex) =>
                              PostList.updateExpansions(itemIndex, keys),
                          expansionTileKey: keys[i - 1],
                        ),
                      ),
                      const CustomDivider(),
                    ],
                  ),
        childCount: (tuple.item1?.length ?? 1) + 1,
      ),
    );
  }
}
