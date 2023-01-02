part of '../view/home_screen.dart';

class CoursePreview extends StatelessWidget {
  const CoursePreview({
    required this.learningSpace,
    Key? key,
  }) : super(key: key);

  final LearningSpace? learningSpace;

  @override
  Widget build(BuildContext context) => Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 8,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor: DarkAppTheme.lightBlue,
          onTap: () async => NavigationManager.instance.navigateToPage(
              path: NavigationConstants.learningSpace,
              data: {'learningSpace': learningSpace}),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.width * 4),
                  child: Ink.image(
                    padding:
                        EdgeInsets.symmetric(horizontal: context.width * 4),
                    image: AssetImage(
                        IconKeys.lsIcons[learningSpace?.iconId ?? 0]),
                    height: context.height * 12,
                    width: context.width * 30,
                    fit: BoxFit.cover,
                  )),
              context.sizedH(.5),
              _courseDescription(context),
            ],
          ),
        ),
      );

  Widget _courseDescription(BuildContext context) => Container(
      padding: EdgeInsets.symmetric(horizontal: context.width * 3),
      width: context.width * 38,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            flex: 10,
            child: Text(learningSpace?.title ?? "",
                textAlign: TextAlign.left,
                style: const TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis),
          ),
          const Spacer(),
          const Icon(Icons.people_alt_outlined, size: 15),
          Text(learningSpace?.participants.length.toString() ?? "",
              textAlign: TextAlign.right)
        ],
      ));
}
