import 'package:flutter_test/flutter_test.dart';
import 'package:learnify/features/learning-space/view/learning_space_detail_screen.dart';

import 'test_helpers.dart';

void main() {
  testWidgets(
    "Test chapter list and item widgets.",
    (WidgetTester tester) async {
      const LearningSpaceDetailScreen detailScreen =
          LearningSpaceDetailScreen();
      await tester.pumpWidget(TestHelpers.appWidget(detailScreen));

      // final Finder tabFinder =
      //     TestHelpers.descendantFinder(detailScreen, DefaultTabController);
      // expect(tabFinder, findsOneWidget);
      // final DefaultTabController tabController =
      //     tester.widget(tabFinder) as DefaultTabController;
      // expect(tabController.initialIndex, 0);

      // final Finder chapterListFinder =
      //     TestHelpers.descendantFinder(detailScreen, ChapterList);
      // expect(chapterListFinder, findsOneWidget);

      // final Finder listFinder =
      //     TestHelpers.descendantFinder(detailScreen, SliverList);
      // expect(listFinder, findsOneWidget);
      // final SliverList sliverList = tester.widget(listFinder) as SliverList;
      // final SliverChildBuilderDelegate delegate =
      //     sliverList.delegate as SliverChildBuilderDelegate;
      // expect(delegate.childCount, 21);

      // final Finder buttonFinder =
      //     TestHelpers.descendantFinder(detailScreen, ActionButton);
      // expect(buttonFinder, findsOneWidget);
      // final ActionButton button = tester.widget(buttonFinder) as ActionButton;
      // expect(button.isActive, true);
      // expect(button.text, TextKeys.createChapter);

      // final Finder chapterFinder =
      //     TestHelpers.descendantFinder(detailScreen, ChapterItem);
      // final ChapterItem firstChapter =
      //     tester.widget(chapterFinder.first) as ChapterItem;
      // expect(firstChapter.itemIndex, 0);

      // final Finder expansionTileFinder =
      //     TestHelpers.descendantFinder(firstChapter, CustomExpansionTile);
      // expect(expansionTileFinder, findsOneWidget);
      // final CustomExpansionTile expansionTile =
      //     tester.widget(expansionTileFinder) as CustomExpansionTile;
      // expect(expansionTile.children.first.runtimeType, CarouselSlider);
      // expect(expansionTile.children.last.runtimeType, Padding);
      // final Padding padding = expansionTile.children.last as Padding;
      // expect(padding.child.runtimeType, ActionButton);
      // final ActionButton? editButton = padding.child as ActionButton?;
      // expect(editButton?.isActive, true);
      // expect(editButton?.text, TextKeys.editChapter);
    },
  );
}
