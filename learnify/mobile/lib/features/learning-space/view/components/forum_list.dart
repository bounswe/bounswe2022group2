part of '../learning_space_detail_screen.dart';

class ForumList extends StatelessWidget {
  const ForumList({Key? key}) : super(key: key);

  static const List<String> demoContent = <String>[
    "Is this space beginner friendly?",
    "Good to finally find others interested in this!",
    "This community grows so fast, maybe it is time for an event",
    "Great stuff",
    "Question: What content do you think is missing here?",
    "So much content here! Any tips on navigating for newcomers?",
    "There is a typo in the description!!!! lame",
    "Starting this as a hobby was my new years' resolution",
    "Posts are getting a bit repetitive :/",
    "Can't believe I've been struggling alone this whole time. Kudos to experienced ones explaining all my questions in annotations"
  ];

  static const List<String> demoCreators = <String>[
    "Altay Akar",
    "Bahrican Kırmızı",
    "Batuhan Nikel",
    "Ezgi Doğu",
    "Ecenur Sezar",
    "Egemen Yavaş",
    "Enes Sürmesiz",
    "Hasan Askerol",
    "Onur Karboncu",
    "Gökay Güneş",
    "Koray Tekçık"
  ];

  @override
  Widget build(BuildContext context) {
    final LearningSpaceViewModel viewModel =
        context.read<LearningSpaceViewModel>();
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, int i) => i == 0
            ? ChapterList.createEditButton(
                context,
                TextKeys.addDiscussion,
                Icons.create,
                viewModel.createDiscussion,
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: context.height * .3),
                    child: TextItem(
                        creator: demoCreators[Random().nextInt(11)],
                        content: demoContent[i],
                        upvotes: Random().nextInt(30)),
                  ),
                  const CustomDivider(),
                ],
              ),
        childCount: Random().nextInt(10),
      ),
    );
  }
}
