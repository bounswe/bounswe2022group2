import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learnify/core/widgets/buttons/action_button.dart';
import 'package:learnify/core/widgets/list/custom_expansion_tile.dart';
import 'package:learnify/core/widgets/text/multiline_text.dart';
import 'package:learnify/features/learning-space/models/event.dart';
import 'package:learnify/features/learning-space/models/geolocation/geolocation_model.dart';
import 'package:learnify/features/learning-space/models/learning_space_model.dart';
import 'package:learnify/features/learning-space/view/learning_space_detail_screen.dart';

import '../test_helpers.dart';

void main() {
  testWidgets(
    "Test event details info.",
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

      final Finder eventFinder =
          TestHelpers.descendantFinder(detailScreen, EventItem);
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

      final List<Widget> eventChildren = expansionTile.children;
      expect(eventChildren.length, equals(11));
      final Widget creator = expansionTile.children[0];
      expect(creator.runtimeType, Row);
      final Row creatorRow = expansionTile.children[0] as Row;

      final Widget description = expansionTile.children[2];
      expect(description.runtimeType, MultiLineText);
      final MultiLineText descriptionText =
          expansionTile.children[2] as MultiLineText;

      final Widget eventDate = expansionTile.children[4];
      expect(eventDate.runtimeType, Row);
      final Row eventDateWidget = expansionTile.children[4] as Row;

      final Widget eventDuration = expansionTile.children[6];
      expect(eventDuration.runtimeType, Row);
      final Row eventDurationWidget = expansionTile.children[6] as Row;

      final Widget participants = expansionTile.children[8];
      expect(participants.runtimeType, Row);
      final Row participantsRow = expansionTile.children[8] as Row;

      final Widget eventMap = expansionTile.children[9];
      expect(eventMap.runtimeType, Padding);
      final Widget? eventChild1 = (eventMap as Padding).child;
      expect(eventChild1.runtimeType, SizedBox);
      expect((eventChild1! as SizedBox).child.runtimeType, EventMap);
      final EventMap eventMapWidget =
          (eventChild1 as SizedBox).child! as EventMap;
      final GeoLocation location = eventMapWidget.location;
      expect(location.latitude, equals(eventModel.geoLocation?.latitude));
      expect(location.longitude, equals(eventModel.geoLocation?.longitude));

      final Widget attendEvent = expansionTile.children[10];
      expect(attendEvent.runtimeType, Padding);
      expect((attendEvent as Padding).child.runtimeType, ActionButton);
      final ActionButton? attendEventWidget =
          attendEvent.child as ActionButton?;
      expect(attendEventWidget?.isActive, true);
    },
  );
}
