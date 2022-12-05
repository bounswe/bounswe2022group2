import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learnify/core/widgets/list/custom_expansion_tile.dart';
import 'package:learnify/core/widgets/text/annotatable/annotatable_text.dart';
import 'package:learnify/features/learning-space/models/annotation/annotation_model.dart';
import 'package:learnify/features/learning-space/models/learning_space_model.dart';
import 'package:learnify/features/learning-space/models/post_model.dart';
import 'package:learnify/features/learning-space/view-model/learning_space_view_model.dart';
import 'package:learnify/features/learning-space/view/learning_space_detail_screen.dart';
import 'package:provider/provider.dart';

import '../test_helpers.dart';

void main() {
  testWidgets(
    "Test text annotation functionality.",
    (WidgetTester tester) async {
      final LearningSpace dummyLearningSpace = LearningSpace.dummy(1);
      final LearningSpaceDetailScreen detailScreen =
          LearningSpaceDetailScreen(learningSpace: dummyLearningSpace);
      await tester.pumpWidget(TestHelpers.appWidget(detailScreen));

      final Finder tabFinder =
          TestHelpers.descendantFinder(detailScreen, DefaultTabController);
      expect(tabFinder, findsOneWidget);
      final DefaultTabController tabController =
          tester.widget(tabFinder) as DefaultTabController;
      expect(tabController.initialIndex, 0);

      final Finder postListFinder =
          TestHelpers.descendantFinder(detailScreen, PostList);
      expect(postListFinder, findsOneWidget);

      final Finder postFinder =
          TestHelpers.descendantFinder(detailScreen, PostItem);
      final PostItem firstPost = tester.widget(postFinder.first) as PostItem;
      expect(firstPost.itemIndex, 0);

      final Finder expansionTileFinder =
          TestHelpers.descendantFinder(firstPost, CustomExpansionTile);
      expect(expansionTileFinder, findsOneWidget);
      final CustomExpansionTile expansionTile =
          tester.widget(expansionTileFinder) as CustomExpansionTile;
      expect(expansionTile.children[4].runtimeType, AnnotatableText);
      final AnnotatableText annotatableText =
          expansionTile.children[4] as AnnotatableText;
      expect(annotatableText.content, isNotNull);
      expect(annotatableText.onAnnotationClick, isNotNull);
      expect(annotatableText.annotateCallback, isNotNull);
      expect(annotatableText.annotateLabel, isNotNull);
      final BuildContext context = tester.element(find.byType(Container).first);
      final LearningSpaceViewModel viewModel =
          context.read<LearningSpaceViewModel>();
      final Post firstPostModel = viewModel.posts.first;
      const String annotationContent = 'This is a great annotation.';
      final Annotation annotation = viewModel.createTextAnnotation(
          3,
          annotatableText.content.length - 5,
          annotationContent,
          firstPostModel,
          0);
      expect(annotation.content, annotationContent);
      expect(annotation.endIndex - annotation.startIndex,
          annotatableText.content.length - 8);
      await tester.pumpAndSettle();
      final Post foundPost =
          viewModel.posts.where((Post c) => c.id == firstPostModel.id).first;
      expect(foundPost.annotations.length, greaterThanOrEqualTo(1));
      final Annotation foundAnnotation = foundPost.annotations.first;
      expect(foundAnnotation, annotation);
    },
  );
}
