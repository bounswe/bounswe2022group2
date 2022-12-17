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
      await tester.pumpWidget(
        TestHelpers.appWidget(detailScreen),
      );

      // expect(eventsList., equals(1));
      // final Finder postListFinder =
      //     TestHelpers.descendantFinder(detailScreen, PostList);
      // expect(postListFinder, findsOneWidget);
    },
  );
}
