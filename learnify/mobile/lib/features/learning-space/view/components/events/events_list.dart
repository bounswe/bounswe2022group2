part of '../../learning_space_detail_screen.dart';

class EventsList extends StatelessWidget {
  const EventsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LearningSpaceViewModel viewModel =
        context.read<LearningSpaceViewModel>();
    final Tuple2<int, List<GlobalKey<CustomExpansionTileState>>> tuple =
        SelectorHelper<Tuple2<int, List<GlobalKey<CustomExpansionTileState>>>,
                LearningSpaceViewModel>()
            .listenValue(
                (LearningSpaceViewModel model) =>
                    Tuple2<int, List<GlobalKey<CustomExpansionTileState>>>(
                        model.events.length, model.eventsExpansionTileKeys),
                context);
    final List<GlobalKey<CustomExpansionTileState>> keys = tuple.item2;
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, int i) => i == 0
            ? ChapterList.createEditButton(context, TextKeys.createEvent,
                Icons.event_available_outlined, viewModel.createEvent)
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: context.height * .3),
                    child: EventItem(
                      itemIndex: i - 1,
                      callback: (int itemIndex) =>
                          ChapterList.updateExpansions(itemIndex, keys),
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
}
