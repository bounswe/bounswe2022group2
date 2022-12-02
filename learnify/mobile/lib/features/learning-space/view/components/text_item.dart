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
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: (creator == StorageKeys.user.name) ? 0 : 10,
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
                  if (creator == StorageKeys.user.name)
                    Wrap(
                      children: <Widget>[
                        IconButton(
                          alignment: Alignment.centerRight,
                          iconSize: 20,
                          padding: const EdgeInsets.only(left: 1),
                          onPressed: () {},
                          icon: const Icon(Icons.edit_sharp),
                        ),
                        IconButton(
                          iconSize: 20,
                          padding: const EdgeInsets.only(left: 5),
                          onPressed: () {},
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              child: Wrap(
                children: <Widget>[
                  Text(
                    content,
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  iconSize: 20,
                  padding: const EdgeInsets.only(left: 5),
                  onPressed: () {
                    //likeToggle = !likeToggle;
                  },
                  icon: const Icon(Icons.thumb_up_outlined),
                ),

                /*likeToggle
                        ? const Icon(Icons.thumb_up_outlined)
                        : const Icon(Icons.thumb_up)),
                        */
                Text(upvotes.toString(), textAlign: TextAlign.right),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      );
}
