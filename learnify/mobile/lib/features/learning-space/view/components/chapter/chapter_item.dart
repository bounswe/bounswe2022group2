part of '../../learning_space_detail_screen.dart';

class ChapterItem extends StatelessWidget {
  const ChapterItem({
    required this.callback,
    required this.itemIndex,
    required this.expansionTileKey,
    Key? key,
  }) : super(key: key);
  final int itemIndex;
  final IndexCallback callback;
  final GlobalKey<CustomExpansionTileState> expansionTileKey;

  @override
  Widget build(BuildContext context) {
    final Chapter chapter = SelectorHelper<Chapter, LearningSpaceViewModel>()
        .listenValue(
            (LearningSpaceViewModel model) => model.chapters[itemIndex],
            context);
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
        highlightColor: context.primary.withOpacity(.15),
        hoverColor: context.primary,
      ),
      child: ListTileTheme(
        contentPadding: EdgeInsets.zero,
        minLeadingWidth: 0,
        minVerticalPadding: 0,
        dense: true,
        child: _expansionTile(context, chapter),
      ),
    );
  }

  Widget _expansionTile(BuildContext context, Chapter chapter) {
    final LearningSpaceViewModel viewModel =
        context.read<LearningSpaceViewModel>();
    return CustomExpansionTile(
      key: expansionTileKey,
      collapsedTextColor: context.inactiveTextColor,
      collapsedIconColor: context.inactiveTextColor,
      tilePadding: EdgeInsets.symmetric(horizontal: context.width * 3),
      childrenPadding: EdgeInsets.symmetric(horizontal: context.width * 3)
          .copyWith(bottom: context.height * 1.7),
      title: MultiLineText('${itemIndex + 1}. ${chapter.title}',
          translated: false),
      expandedCrossAxisAlignment: CrossAxisAlignment.center,
      expandedAlignment: Alignment.centerLeft,
      iconColor: context.primary,
      onExpansionChanged: (bool val) {
        if (val) {
          callback(itemIndex);
          viewModel.setDefault();
        }
      },
      children: <Widget>[
        BaseText(TextKeys.clickToSeeImageAnnotations,
            style: context.labelMedium),
        _carouselSlider(viewModel, chapter, context),
        _sliderIndicator(viewModel, chapter),
        context.sizedH(1.4),
        AnnotatableText(
          key: PageStorageKey<String>(chapter.materialText ?? ''),
          content: chapter.materialText ?? '',
          annotateLabel: context.tr(TextKeys.annotate),
          annotateCallback: (int startIndex, int endIndex) async {
            await DialogBuilder(context).annotateDialog(
              chapter.id,
              textCallback: viewModel.annotateText,
              startIndex: startIndex,
              endIndex: endIndex,
            );
          },
          allAnnotations: chapter.annotations,
          onAnnotationClick:
              (String annotationId, String annotationText) async {
            await DialogBuilder(context).textDialog(
                annotationText, 'Clicked Annotation:',
                translateTitle: false);
          },
        ),
        ChapterList.createEditButton(context, TextKeys.editChapter,
            Icons.edit_outlined, viewModel.editChapter),
      ],
    );
  }

  CarouselSlider _carouselSlider(
      LearningSpaceViewModel viewModel, Chapter chapter, BuildContext context) {
    final List<String> images = chapter.materialVisual;
    return CarouselSlider.builder(
      key: PageStorageKey<String>(
          '${chapter.id} - ${chapter.annotations.toList()}'),
      itemCount: images.length,
      carouselController: viewModel.carouselControllers[itemIndex],
      options: CarouselOptions(
        aspectRatio: 20 / 9,
        viewportFraction: 0.75,
        enlargeCenterPage: true,
        autoPlay: true,
        enableInfiniteScroll: false,
        onPageChanged: (int newIndex, _) =>
            viewModel.setCarouselPageIndex(newIndex, itemIndex),
      ),
      itemBuilder: (_, int i, __) {
        final List<Annotation> imageAnnotations = chapter.annotations
            .where((Annotation a) => a.isImage && a.imageUrl == images[i])
            .toList();
        return GestureDetector(
          onTap: () => NavigationManager.instance.navigateToPage(
              path: NavigationConstants.chapterImage,
              data: <String, dynamic>{
                'image': images[i],
                'all_annotations': chapter.annotations,
                'chapter_id': chapter.id,
              }),
          child: AnnotatableImage.network(
            images[i],
            annotateCallback: (Offset start, Offset end, Color color) async =>
                null,
            scalable: false,
            initialColor: context.primary,
            initialPaintMode: PaintMode.none,
            paintHistory:
                List<PaintInfo>.generate(imageAnnotations.length, (int i) {
              final Annotation a = imageAnnotations[i];
              return PaintInfo(
                annotation: a,
                offset: <Offset>[a.startOffset, a.endOffset],
                painter: Paint()
                  ..color = a.color
                  ..strokeWidth = 4
                  ..style = PaintingStyle.stroke,
              );
            }),
          ),
        );
      },
    );
  }

  Widget _sliderIndicator(LearningSpaceViewModel viewModel, Chapter chapter) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(
          chapter.materialVisual.length,
          (int i) => GestureDetector(
            onTap: () =>
                viewModel.carouselControllers[itemIndex].animateToPage(i),
            child: SelectorHelper<int, LearningSpaceViewModel>().builder(
              (_, LearningSpaceViewModel model) =>
                  model.carouselPageIndexes[itemIndex],
              (BuildContext context, int index, _) => Container(
                width: context.width * 2.5,
                height: context.width * 2.5,
                margin: EdgeInsets.symmetric(
                    vertical: context.height, horizontal: context.width),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.primary.withOpacity(index == i ? 0.9 : 0.4),
                ),
              ),
            ),
          ),
        ),
      );
}
