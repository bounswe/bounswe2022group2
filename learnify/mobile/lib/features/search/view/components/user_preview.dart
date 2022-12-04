part of '../search_screen.dart';

class UserPreview extends StatelessWidget {
  const UserPreview({
    required this.userName,
    required this.profilePhoto,
    Key? key,
  }) : super(key: key);

  final String userName;
  final String profilePhoto;

  @override
  Widget build(BuildContext context) => Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor: DarkAppTheme.lightBlue,
          onTap: () {},
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.width * 4),
                  child: Ink.image(
                    padding:
                        EdgeInsets.symmetric(horizontal: context.width * 4),
                    image: AssetImage(profilePhoto),
                    height: context.height * 15,
                    width: context.width * 30,
                    fit: BoxFit.scaleDown,
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
            child: Text(userName,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis),
          ),
        ],
      ));
}
