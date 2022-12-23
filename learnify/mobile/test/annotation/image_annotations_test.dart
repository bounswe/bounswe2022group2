import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learnify/core/widgets/list/custom_expansion_tile.dart';
import 'package:learnify/features/learning-space/models/annotation/annotation_model.dart';
import 'package:learnify/features/learning-space/models/learning_space_model.dart';
import 'package:learnify/features/learning-space/models/post_model.dart';
import 'package:learnify/features/learning-space/view-model/learning_space_view_model.dart';
import 'package:learnify/features/learning-space/view/learning_space_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../test_helpers.dart';

void main() {
  testWidgets(
    "Test image annotation functionality.",
    (WidgetTester tester) async {
      final LearningSpace dummyLearningSpace = LearningSpace.dummy(1);
      final LearningSpaceDetailScreen detailScreen =
          LearningSpaceDetailScreen(learningSpace: dummyLearningSpace);
      await tester.pumpWidget(
        TestHelpers.appWidget(
          detailScreen,
          childCallback: (BuildContext c) {
            final LearningSpaceViewModel viewModel =
                c.read<LearningSpaceViewModel>();
            viewModel.annotations['0'] = <Annotation>[];
            viewModel.annotations['1'] = <Annotation>[];
          },
        ),
      );

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

      final CarouselSlider carouselSlider =
          expansionTile.children[1] as CarouselSlider;
      expect(carouselSlider.itemCount, greaterThan(0));
      expect(carouselSlider.options.autoPlay, true);
      expect(carouselSlider.options.enlargeCenterPage, true);
      expect(carouselSlider.options.enableInfiniteScroll, false);
      final BuildContext context = tester.element(find.byType(Container).first);
      final LearningSpaceViewModel viewModel =
          context.read<LearningSpaceViewModel>();
      final Post firstPostModel = viewModel.posts.first;
      const String annotationContent = 'This is a great annotation.';
      const Offset startOffset = Offset(0, 12);
      const Offset endOffset = Offset(98, 210);
      const Color color = Colors.red;
      const String imageUrl = 'https://picsum.photos/id/1/700/400';
      final Annotation annotation = (await viewModel.createImageAnnotation(
        startOffset,
        endOffset,
        color,
        imageUrl,
        annotationContent,
        '0',
        'bahricanyesil',
        firstPostModel,
        0,
      ))
          .item2;
      final Tuple2<Offset, Offset> offsets = annotation.startEndOffsets;
      expect(annotation.body, annotationContent);
      expect(offsets.item1, startOffset);
      expect(offsets.item2, endOffset);
      expect(annotation.color, color);
      expect(annotation.imageUrl, imageUrl);
      await tester.pumpAndSettle();
      final Post foundPost =
          viewModel.posts.where((Post c) => c.id == firstPostModel.id).first;
      final List<Annotation> foundAnnotations =
          await viewModel.getPostAnnotations(foundPost.id ?? '');
      expect(foundAnnotations.length, greaterThanOrEqualTo(1));
      final Annotation foundAnnotation = foundAnnotations.first;
      expect(foundAnnotation, annotation);
    },
  );
}
