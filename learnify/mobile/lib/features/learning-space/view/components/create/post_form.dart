part of '../../add_post_screen.dart';

class _PostForm extends StatelessWidget {
  const _PostForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddPostViewModel model = context.read<AddPostViewModel>();
    return Form(
      key: model.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(child: _titleField(model.titleController)),
          context.sizedH(.5),
          Flexible(child: _contentField(model.contentController)),
          context.sizedH(1.5),
        ],
      ),
    );
  }

  Widget _titleField(TextEditingController controller) => CustomTextFormField(
        key: AddPostKeys.titleField,
        controller: controller,
        hintText: TextKeys.addPostTitleHint,
        labelText: TextKeys.addPostTitleLabel,
        textInputAction: TextInputAction.next,
        textInputType: TextInputType.name,
        padding: const EdgeInsets.all(10),
      );

  Widget _contentField(TextEditingController controller) => CustomTextFormField(
        key: AddPostKeys.contentField,
        controller: controller,
        hintText: TextKeys.addPostContentHint,
        labelText: TextKeys.addPostContentLabel,
        textInputAction: TextInputAction.newline,
        textInputType: TextInputType.multiline,
        padding: const EdgeInsets.all(10),
      );
}
