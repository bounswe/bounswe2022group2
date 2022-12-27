import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learnify/core/widgets/buttons/action_button.dart';
import 'package:learnify/features/learning-space/models/learning_space_model.dart';
import 'package:learnify/features/view-learning-spaces/view/view_all_list.dart';

import 'test_helpers.dart';

void main() {
  testWidgets(
    "Test create learning space button and taken learning spaces list",
    (WidgetTester tester) async {
      final List<LearningSpace> list = <LearningSpace>[
        const LearningSpace(),
        const LearningSpace(),
      ];

      final ViewAllList viewAllScreen =
          ViewAllList(listOfLearningSpaces: list, buttonExist: false);

      await tester.pumpWidget(TestHelpers.appWidget(viewAllScreen));

      final Finder buttonFinder =
          TestHelpers.descendantFinder(viewAllScreen, ActionButton);
      expect(buttonFinder, findsNothing);

      final Finder gridViewFinder =
          TestHelpers.descendantFinder(viewAllScreen, GridView);
      expect(gridViewFinder, findsOneWidget);
      final GridView gridView = tester.widget(gridViewFinder) as GridView;

      expect(gridView.physics, const ScrollPhysics());
      expect(gridView.shrinkWrap, true);
      expect(gridView.childrenDelegate.estimatedChildCount, 2);
    },
  );
}
