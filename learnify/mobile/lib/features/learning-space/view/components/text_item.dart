part of './../annotations_screen.dart';

///Card Widget for discussion and annotation items
class TextItem extends StatelessWidget {
  const TextItem({
    required this.creator,
    required this.content,
    this.upvotes = 0,
    Key? key,
  }) : super(key: key);

  final String creator;
  final int upvotes;
  final String content;

  @override
  Widget build(BuildContext context) => Card(
        color: context.isDark ? Colors.black54 : Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.width, vertical: context.height * 1.3),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: (creator ==
                          LocalManager.instance
                              .getModel(const User(), StorageKeys.user)
                              .username)
                      ? 0
                      : 6,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      creator,
                      textAlign: TextAlign.left,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    if (creator ==
                        LocalManager.instance
                            .getModel(const User(), StorageKeys.user)
                            .username)
                      Wrap(
                        children: <Widget>[
                          BaseIconButton(
                            padding: const EdgeInsets.only(left: 1),
                            onPressed: () {},
                            sizeFactor: 6.6,
                            icon: Icons.edit_sharp,
                          ),
                          BaseIconButton(
                            padding: const EdgeInsets.only(left: 5),
                            onPressed: () {},
                            sizeFactor: 6.6,
                            icon: Icons.delete,
                          ),
                        ],
                      )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Text(content, textAlign: TextAlign.left),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  BaseIconButton(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.width * 1.6,
                        vertical: context.height * 0.6),
                    onPressed: () {
                      //likeToggle = !likeToggle;
                    },
                    sizeFactor: 6.2,
                    icon: Icons.thumb_up_outlined,
                  ),

                  /*likeToggle
                          ? const Icon(Icons.thumb_up_outlined)
                          : const Icon(Icons.thumb_up)),
                          */
                  Text(upvotes.toString(), textAlign: TextAlign.right),
                  SizedBox(width: context.width * 2.5),
                ],
              ),
            ],
          ),
        ),
      );
}
