part of '../../learning_space_detail_screen.dart';

class PostItem extends StatelessWidget {
  const PostItem({
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
    final Post post = SelectorHelper<Post, LearningSpaceViewModel>()
        .listenValue(
            (LearningSpaceViewModel model) => model.posts[itemIndex], context);
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
        child: _expansionTile(context, post),
      ),
    );
  }

  Widget _expansionTile(BuildContext context, Post post) {
    final LearningSpaceViewModel viewModel =
        context.read<LearningSpaceViewModel>();
    final List<Annotation>? mapAnnotations =
        SelectorHelper<List<Annotation>?, LearningSpaceViewModel>().listenValue(
            (LearningSpaceViewModel model) => model.getFromMap(post.id ?? ''),
            context);
    return CustomExpansionTile(
      key: expansionTileKey,
      collapsedTextColor: context.inactiveTextColor,
      collapsedIconColor: context.inactiveTextColor,
      tilePadding: EdgeInsets.symmetric(horizontal: context.width * 3),
      childrenPadding: EdgeInsets.symmetric(horizontal: context.width * 3)
          .copyWith(bottom: context.height * 1.7),
      title:
          MultiLineText('${itemIndex + 1}. ${post.title}', translated: false),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      expandedAlignment: Alignment.centerLeft,
      iconColor: context.primary,
      onExpansionChanged: (bool val) async {
        if (val) {
          if (mapAnnotations == null) {
            await viewModel.getPostAnnotations(post.id ?? '');
          }
          callback(itemIndex);
        }
      },
      children: _children(context, post, mapAnnotations ?? <Annotation>[]),
    );
  }

  List<Widget> _children(
      BuildContext context, Post post, List<Annotation> annotations) {
    final LearningSpaceViewModel viewModel =
        context.read<LearningSpaceViewModel>();
    return <Widget>[
      Center(
        child: BaseText(TextKeys.clickToSeeImageAnnotations,
            style: context.labelMedium),
      ),
      _carouselSlider(viewModel, post, annotations, context),
      _sliderIndicator(viewModel, post),
      context.sizedH(1.4),
      AnnotatableText(
        key: PageStorageKey<String>(post.content ?? 'asd'),
        content: post.content ?? '',
        annotateLabel: context.tr(TextKeys.annotate),
        annotateCallback: (int startIndex, int endIndex) async {
          await DialogBuilder(context).annotateDialog(
            post.id,
            textCallback: (int startIndex, int endIndex, String annotation,
                String? postId) async {
              final HomeViewModel viewModel = context.read<HomeViewModel>();
              final Tuple3<LearningSpace?, Annotation?, String?> res =
                  await context
                      .read<LearningSpaceViewModel>()
                      .annotateText(startIndex, endIndex, annotation, postId);
              viewModel.updateLs(res.item1);
              return Tuple2<Annotation?, String?>(res.item2, res.item3);
            },
            startIndex: startIndex,
            endIndex: endIndex,
          );
        },
        allAnnotations: annotations,
        onAnnotationClick:
            (List<Annotation> annotations, String annotationText) async {
          //await DialogBuilder(context).textDialog(annotationText, 'Clicked Annotation:',translateTitle: false);
          await viewModel.viewAnnotations(annotations, annotationText);
        },
      ),
      Row(
        children: <Widget>[
          Expanded(
              child: PostList.createEditButton(context, TextKeys.editPost,
                  Icons.edit_outlined, () async => viewModel.editPost(post))),
          Expanded(
            child: PostList.createEditButton(
                context, TextKeys.addComment, Icons.comment_outlined, () async {
              //final HomeViewModel viewModel = context.read<HomeViewModel>();
              //final Tuple2<LearningSpace?, String?> res =
              await context
                  .read<LearningSpaceViewModel>()
                  .addCommentDialog(context, post.id);
              //viewModel.updateLs(res.item1);
              // return Tuple2<Annotation?, String?>(res.item2, res.item3);
            }),
          ),
        ],
      ),
      _viewComments(context, post),
    ];
  }

  CarouselSlider _carouselSlider(LearningSpaceViewModel viewModel, Post post,
      List<Annotation> annotations, BuildContext context) {
    final List<String> images = post.images;
    return CarouselSlider.builder(
      key: PageStorageKey<String>('${post.id} - ${annotations.toList()}'),
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
        final List<Annotation> imageAnnotations = annotations
            .where((Annotation a) => a.isImage && a.imageUrl == images[i])
            .toList();
        return GestureDetector(
          onTap: () => NavigationManager.instance.navigateToPage(
            path: NavigationConstants.postImage,
            data: <String, dynamic>{
              'image': images[i],
              'all_annotations': annotations,
              'post_id': post.id,
            },
          ),
          child: AnnotatableImage(
            networkUrl: images[i],
            annotateCallback: (Offset start, Offset end, Color color) async =>
                null,
            key: Key(images[i]),
            isScalable: false,
            initialColor: context.primary,
            initialPaintMode: PaintMode.none,
            paintHistory:
                List<PaintInfo>.generate(imageAnnotations.length, (int i) {
              final Annotation a = imageAnnotations[i];
              final Tuple2<Offset, Offset> offsets = a.startEndOffsets;
              return PaintInfo(
                annotation: a,
                offset: <Offset>[offsets.item1, offsets.item2],
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

  Widget _sliderIndicator(LearningSpaceViewModel viewModel, Post post) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(
          post.images.length,
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

  static Widget _viewComments(BuildContext context, Post post) => TextButton(
        child: BaseText(
          TextKeys.viewComments,
          style: context.titleSmall,
          color: context.primary,
        ),
        onPressed: () async => NavigationManager.instance.navigateToPage(
            path: NavigationConstants.comments,
            data: <String, dynamic>{'post': post}),
      );
}
