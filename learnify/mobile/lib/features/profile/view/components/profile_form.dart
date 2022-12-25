part of '../profile_screen.dart';

class _ProfileForm extends StatelessWidget {
  const _ProfileForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      SelectorHelper<Profile?, ProfileViewModel>()
          .builder((_, ProfileViewModel model) => model.profile,
              (BuildContext context, Profile? profile, _) {
        final ProfileViewModel model = context.read<ProfileViewModel>();
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Flexible(
                child: BaseText(TextKeys.usernameColon,
                    style: TextStyle(fontWeight: FontWeight.bold))),
            Flexible(
                child: BaseText(profile!.username ?? 'hasanarisan',
                    style: context.bodyMedium, translated: false)),
            context.sizedH(1.5),
            const Flexible(
                child: BaseText(TextKeys.emailColon,
                    style: TextStyle(fontWeight: FontWeight.bold))),
            Flexible(
                child: BaseText(profile.email ?? 'hasanarisan@gmail.com',
                    style: context.bodyMedium, translated: false)),
            context.sizedH(1.5),
            Form(
              key: model.biographyFormKey,
              child:
                  Flexible(child: _biographyField(model.biographyController)),
            ),
          ],
        );
      });

  Widget _biographyField(TextEditingController controller) =>
      CustomTextFormField(
        maxLines: 8,
        key: ProfileKeys.biographyField,
        controller: controller,
        hintText: TextKeys.addBiographyHint,
        labelText: TextKeys.biography,
        prefixIcon: Icons.contact_support_outlined,
        textInputAction: TextInputAction.newline,
        textInputType: TextInputType.multiline,
        maxLength: 200,
        padding: const EdgeInsets.all(10),
      );
}
