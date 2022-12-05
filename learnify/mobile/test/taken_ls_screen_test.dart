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

      final ViewAllList takenLsScreen =
          ViewAllList(listOfLearningSpaces: list, buttonExist: true);

      await tester.pumpWidget(TestHelpers.appWidget(takenLsScreen));

      final Finder buttonFinder =
          TestHelpers.descendantFinder(takenLsScreen, ActionButton);
      expect(buttonFinder, findsOneWidget);
      final ActionButton actionButton =
          tester.widget(buttonFinder) as ActionButton;

      final Finder gridViewFinder =
          TestHelpers.descendantFinder(takenLsScreen, GridView);
      expect(gridViewFinder, findsOneWidget);
      final GridView gridView = tester.widget(gridViewFinder) as GridView;

      expect(actionButton.isActive, true);

      expect(gridView.physics, const ScrollPhysics());
      expect(gridView.shrinkWrap, true);
      expect(gridView.childrenDelegate.estimatedChildCount, 2);
    },
  );
}
