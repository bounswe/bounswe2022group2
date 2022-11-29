part of '../view/home_screen.dart';

class CoursePreview extends StatelessWidget {
  const CoursePreview({
    required this.textKey,
    required this.participantNumber,
    // ignore: unused_element
    this.courseImage = IconKeys.learnIllustration,
    Key? key,
  }) : super(key: key);

  final String textKey;
  final int participantNumber;
  final String courseImage;

  @override
  Widget build(BuildContext context) => Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 8,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor: DarkAppTheme.lightBlue,
          onTap: () async => NavigationManager.instance
              .navigateToPage(path: NavigationConstants.learningSpace),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.width * 4),
                  child: Ink.image(
                    padding:
                        EdgeInsets.symmetric(horizontal: context.width * 4),
                    image: AssetImage(courseImage),
                    height: context.height * 10,
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
            child: Text(textKey,
                textAlign: TextAlign.left,
                style: const TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis),
          ),
          const Spacer(),
          const Icon(Icons.people_alt_outlined, size: 15),
          Text(participantNumber.toString(), textAlign: TextAlign.right)
        ],
      ));
}
