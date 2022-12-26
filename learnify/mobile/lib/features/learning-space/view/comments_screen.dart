import 'package:flutter/material.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../core/extensions/context/context_extensions.dart';
import '../../../core/extensions/context/theme_extensions.dart';
import '../../../core/widgets/app-bar/default_app_bar.dart';
import '../../../core/widgets/text/base_text.dart';
import '../../../product/language/language_keys.dart';
import '../models/comment/comment_model.dart';
import '../models/post_model.dart';
import '../view-model/learning_space_view_model.dart';
import 'annotations_screen.dart';

class CommentsScreen extends BaseView<LearningSpaceViewModel> {
  CommentsScreen({required Post post, Key? key})
      : super(
          builder: (BuildContext context) => _builder(context, post),
          appBar: _appBarBuilder,
          scrollable: true,
          key: key,
        );

  static Widget _builder(
    BuildContext context,
    Post post,
  ) =>
      Column(
        children: <Widget>[
          context.sizedH(2),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: _targetPost(context, post),
          ),
          context.sizedH(2),
          ...List<Widget>.generate(
            post.comments.length,
            (int i) {
              final Comment a = post.comments[i];
              return TextItem(
                creator: a.creator ?? "ezgi",
                content: a.content ?? "This post is great",
              );
            },
          ),
        ],
      );

  static Widget _targetPost(BuildContext context, Post post) => Column(
        children: <Widget>[
          Text(
            post.title ?? '',
            style: context.titleMedium,
            overflow: TextOverflow.clip,
          ),
          if (post.images.isNotEmpty)
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                  controller: PageController(viewportFraction: 0.8),
                  itemCount: post.images.length,
                  itemBuilder: (BuildContext context, int index) => Container(
                        margin: const EdgeInsets.all(10),
                        child: Image.network(
                          post.images[index],
                          fit: BoxFit.cover,
                        ),
                      )),
            ),
          Text(
            post.content ?? '',
            style: context.bodyMedium,
            overflow: TextOverflow.clip,
          ),
        ],
      );

  static DefaultAppBar _appBarBuilder(BuildContext context) => DefaultAppBar(
        size: context.height * 6,
        color: context.lightDarkActiveColor,
        actionsList: <Widget>[
          BaseText(
            TextKeys.viewComments,
            style: context.titleMedium,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ],
        showBack: true,
        padding: EdgeInsets.symmetric(
            horizontal: context.responsiveSize * 3,
            vertical: context.responsiveSize * 2.5),
      );
}
