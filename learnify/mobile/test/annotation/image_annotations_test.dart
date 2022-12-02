import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learnify/core/widgets/list/custom_expansion_tile.dart';
import 'package:learnify/features/learning-space/models/annotation/annotation_model.dart';
import 'package:learnify/features/learning-space/models/chapter_model.dart';
import 'package:learnify/features/learning-space/models/learning_space_model.dart';
import 'package:learnify/features/learning-space/view-model/learning_space_view_model.dart';
import 'package:learnify/features/learning-space/view/learning_space_detail_screen.dart';
import 'package:provider/provider.dart';

import '../test_helpers.dart';

void main() {
  testWidgets(
    "Test text annotation functionality.",
    (WidgetTester tester) async {
      const LearningSpace dummyLearningSpace = LearningSpace();
      final LearningSpaceDetailScreen detailScreen =
          LearningSpaceDetailScreen(learningSpace: dummyLearningSpace);
      await tester.pumpWidget(TestHelpers.appWidget(detailScreen));

      final Finder tabFinder =
          TestHelpers.descendantFinder(detailScreen, DefaultTabController);
      expect(tabFinder, findsOneWidget);
      final DefaultTabController tabController =
          tester.widget(tabFinder) as DefaultTabController;
      expect(tabController.initialIndex, 0);

      final Finder chapterListFinder =
          TestHelpers.descendantFinder(detailScreen, ChapterList);
      expect(chapterListFinder, findsOneWidget);

      final Finder chapterFinder =
          TestHelpers.descendantFinder(detailScreen, ChapterItem);
      final ChapterItem firstChapter =
          tester.widget(chapterFinder.first) as ChapterItem;
      expect(firstChapter.itemIndex, 0);

      final Finder expansionTileFinder =
          TestHelpers.descendantFinder(firstChapter, CustomExpansionTile);
      expect(expansionTileFinder, findsOneWidget);
      final CustomExpansionTile expansionTile =
          tester.widget(expansionTileFinder) as CustomExpansionTile;

      final CarouselSlider carouselSlider =
          expansionTile.children[1] as CarouselSlider;
      expect(carouselSlider.itemCount, greaterThan(0));
      expect(carouselSlider.options.autoPlay, true);
      expect(carouselSlider.options.enlargeCenterPage, true);
      expect(carouselSlider.options.enableInfiniteScroll, false);
      final BuildContext context = tester.element(find.byType(Container).first);
      final LearningSpaceViewModel viewModel =
          context.read<LearningSpaceViewModel>();
      final Chapter firstChapterModel = viewModel.chapters.first;
      const String annotationContent = 'This is a great annotation.';
      const Offset startOffset = Offset(0, 12);
      const Offset endOffset = Offset(98, 210);
      const Color color = Colors.red;
      const String imageUrl = 'https://picsum.photos/id/1/700/400';
      final Annotation annotation = viewModel.createImageAnnotation(
        startOffset,
        endOffset,
        color,
        imageUrl,
        annotationContent,
        firstChapterModel,
        0,
      );
      expect(annotation.content, annotationContent);
      expect(annotation.startOffset, startOffset);
      expect(annotation.endOffset, endOffset);
      expect(annotation.color, color);
      expect(annotation.imageUrl, imageUrl);
      await tester.pumpAndSettle();
      final Chapter foundChapter = viewModel.chapters
          .where((Chapter c) => c.id == firstChapterModel.id)
          .first;
      expect(foundChapter.annotations.length, 1);
      final Annotation foundAnnotation = foundChapter.annotations.first;
      expect(foundAnnotation, annotation);
    },
  );
}
