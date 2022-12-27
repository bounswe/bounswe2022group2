import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:learnify/core/widgets/buttons/action_button.dart';
import 'package:learnify/core/widgets/list/custom_expansion_tile.dart';
import 'package:learnify/core/widgets/text/base_text.dart';
import 'package:learnify/features/learning-space/models/event/event.dart';
import 'package:learnify/features/learning-space/models/learning_space_model.dart';
import 'package:learnify/features/learning-space/view-model/learning_space_view_model.dart';
import 'package:learnify/features/learning-space/view/learning_space_detail_screen.dart';
import 'package:provider/provider.dart';

import '../test_helpers.dart';

void main() {
  testWidgets(
    "Test view events functionality.",
    (WidgetTester tester) async {
      late final LearningSpace dummyLearningSpace = LearningSpace.dummy(1);
      final LearningSpaceDetailScreen detailScreen = LearningSpaceDetailScreen(
          learningSpace: dummyLearningSpace, initialIndex: 2);
      await tester.pumpWidget(
        TestHelpers.appWidget(
          detailScreen,
          childCallback: (BuildContext context) => context
              .read<LearningSpaceViewModel>()
              .setEvents(List<Event>.generate(3, Event.dummy),
                  dummyLearningSpace.id ?? ''),
        ),
      );

      final Finder tabFinder =
          TestHelpers.descendantFinder(detailScreen, DefaultTabController);
      expect(tabFinder, findsOneWidget);
      final DefaultTabController tabController =
          tester.widget(tabFinder) as DefaultTabController;
      expect(tabController.initialIndex, equals(2));

      final Finder tabViewFinder =
          TestHelpers.descendantFinder(detailScreen, TabBarView);
      final TabBarView tabView = tester.widget(tabViewFinder) as TabBarView;
      expect(tabView.children.length, equals(3));

      final Finder eventsListFinder =
          TestHelpers.descendantFinder(detailScreen, EventsList);
      expect(eventsListFinder, findsOneWidget);
      final EventsList eventsList =
          tester.widget(eventsListFinder) as EventsList;

      final Finder sliverListFinder =
          TestHelpers.descendantFinder(eventsList, SliverList);
      expect(sliverListFinder, findsOneWidget);
      final SliverList sliverList =
          tester.widget(sliverListFinder) as SliverList;
      final SliverChildBuilderDelegate sliverDelegate =
          sliverList.delegate as SliverChildBuilderDelegate;
      expect(sliverDelegate.childCount, 4);

      final Finder createEventButtonFinder =
          TestHelpers.descendantFinder(eventsList, ActionButton);
      expect(createEventButtonFinder, findsWidgets);
      final ActionButton createEventButton =
          tester.widget(createEventButtonFinder.first) as ActionButton;
      expect(createEventButton.isActive, true);

      final Finder eventFinder =
          TestHelpers.descendantFinder(eventsList, EventItem);
      expect(eventFinder, findsWidgets);
      final EventItem firstEvent =
          tester.widget(eventFinder.first) as EventItem;
      expect(firstEvent.itemIndex, 0);

      final Finder expansionTileFinder =
          TestHelpers.descendantFinder(firstEvent, CustomExpansionTile);
      expect(expansionTileFinder, findsOneWidget);
      final CustomExpansionTile expansionTile =
          tester.widget(expansionTileFinder) as CustomExpansionTile;

      final Event eventModel = firstEvent.event;

      final Widget eventTitle = expansionTile.title;
      expect(eventTitle.runtimeType, Row);
      final Row titleWidget = expansionTile.title as Row;
      expect(titleWidget.children[0].runtimeType, Flexible);
      final Flexible titleTextWrapper = titleWidget.children[0] as Flexible;
      expect(titleWidget.children[1].runtimeType, BaseText);
      final BaseText dateText = titleWidget.children[1] as BaseText;
      expect(titleTextWrapper.child.runtimeType, BaseText);
      final BaseText titleText = titleTextWrapper.child as BaseText;
      expect(
          titleText.text, '${firstEvent.itemIndex + 1}. ${eventModel.title}');
      expect(
        dateText.text,
        DateFormat('dd MMM - kk:mm').format(eventModel.date ?? DateTime.now()),
      );
    },
  );
}
