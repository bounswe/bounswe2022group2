part of '../others_profile_screen.dart';

class _OthersInfo extends StatelessWidget {
  const _OthersInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      SelectorHelper<Profile?, OthersProfileViewModel>().builder(
          (_, OthersProfileViewModel model) => model.profile,
          (BuildContext context, Profile? profile, _) => Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Flexible(
                      child: BaseText(TextKeys.usernameColon,
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Flexible(
                      child: BaseText(profile!.username ?? 'hasanarisan',
                          style: context.bodyMedium, translated: false)),
                  context.sizedH(1.5),
                  if (profile.bio != null)
                    const Flexible(
                        child: BaseText(TextKeys.biographyColon,
                            style: TextStyle(fontWeight: FontWeight.bold))),
                  if (profile.bio != null)
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: context.responsiveSize * 10),
                      child: MultiLineText(
                        profile.bio!,
                        style: context.bodyMedium,
                        translated: false,
                        maxLines: 300,
                      ),
                    ),
                  context.sizedH(1.5),
                ],
              ));
}
