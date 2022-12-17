import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learnify/features/learning-space/models/learning_space_model.dart';
import 'package:learnify/features/learning-space/view/learning_space_detail_screen.dart';

import '../test_helpers.dart';

void main() {
  testWidgets(
    "Test view events functionality.",
    (WidgetTester tester) async {
      late final LearningSpace dummyLearningSpace = LearningSpace.dummy(1);
      final LearningSpaceDetailScreen detailScreen = LearningSpaceDetailScreen(
          learningSpace: dummyLearningSpace, initialIndex: 2);
      await tester.pumpWidget(TestHelpers.appWidget(detailScreen));

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

      final Finder eventFinder =
          TestHelpers.descendantFinder(eventsList, EventItem);
      expect(eventFinder, findsWidgets);
      final EventItem firstEvent =
          tester.widget(eventFinder.first) as EventItem;
      expect(firstEvent.itemIndex, 0);
    },
  );
}
