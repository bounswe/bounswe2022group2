part of '../../learning_space_detail_screen.dart';

class _ChapterItem extends StatelessWidget {
  const _ChapterItem({
    required this.chapter,
    required this.callback,
    required this.itemIndex,
    required this.expansionTileKey,
    Key? key,
  }) : super(key: key);
  final Chapter chapter;
  final int itemIndex;
  final VoidCallback callback;
  final GlobalKey<CustomExpansionTileState> expansionTileKey;

  @override
  Widget build(BuildContext context) => Theme(
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
          child: _expansionTile(context),
        ),
      );

  Widget _expansionTile(BuildContext context) {
    final LearningSpaceViewModel viewModel =
        context.read<LearningSpaceViewModel>();
    return CustomExpansionTile(
      key: expansionTileKey,
      collapsedTextColor: context.inactiveTextColor,
      collapsedIconColor: context.inactiveTextColor,
      tilePadding: EdgeInsets.symmetric(horizontal: context.width * 3),
      childrenPadding: EdgeInsets.symmetric(horizontal: context.width * 5)
          .copyWith(bottom: context.height * 1.7),
      title: MultiLineText('${itemIndex + 1}. ${chapter.title}',
          translated: false),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      expandedAlignment: Alignment.centerLeft,
      iconColor: context.primary,
      onExpansionChanged: (bool val) {
        if (val) {
          callback();
          viewModel.setDefault();
        }
      },
      children: <Widget>[
        _carouselSlider(viewModel),
        _sliderIndicator(viewModel),
        context.sizedH(1.4),
        MultiLineText(
            '    ${chapter.materialText?.replaceAll('\n', '\n\n    ')}',
            maxLines: 10000,
            translated: false),
      ],
    );
  }

  CarouselSlider _carouselSlider(LearningSpaceViewModel viewModel) {
    final List<String> images = chapter.materialVisual;
    return CarouselSlider.builder(
      key: PageStorageKey<String>(chapter.id ?? ''),
      itemCount: images.length,
      carouselController: viewModel.carouselController,
      options: CarouselOptions(
        aspectRatio: 20 / 9,
        viewportFraction: 0.75,
        enlargeCenterPage: true,
        autoPlay: true,
        enableInfiniteScroll: false,
        onPageChanged: (int newIndex, _) =>
            viewModel.setCarouselPageIndex(newIndex),
      ),
      itemBuilder: (BuildContext context, int i, int pageViewIndex) =>
          CustomNetworkImage(images[i]),
    );
  }

  Widget _sliderIndicator(LearningSpaceViewModel viewModel) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(
          chapter.materialVisual.length,
          (int i) => GestureDetector(
            onTap: () => viewModel.carouselController.animateToPage(i),
            child: SelectorHelper<int, LearningSpaceViewModel>().builder(
              (_, LearningSpaceViewModel model) => model.carouselPageIndex,
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
