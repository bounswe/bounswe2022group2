part of '../../create_learning_space_screen.dart';

class _AddCategories extends StatelessWidget {
  const _AddCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ExpansionTile(
        key: CreateLearningSpaceKeys.categoriesField,
        title: const BaseText(TextKeys.addCategoriesHint),
        children: <Widget>[
          SelectorHelper<List<String>, CreateLearningSpaceViewModel>().builder(
            (_, CreateLearningSpaceViewModel model) =>
                model.selectedCategoryNames,
            (BuildContext context, List<String> selectedCategories,
                    Widget? child) =>
                Wrap(
                    runSpacing: 5,
                    spacing: 5,
                    children: CreateLearningSpaceViewModel.categoryOptions
                        .map((Category category) {
                      final bool isChecked =
                          selectedCategories.contains(category.categoryName);
                      return LabeledCheckbox(
                        label: category.categoryName,
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        value: isChecked,
                        onChanged: (bool newValue) {
                          final CreateLearningSpaceViewModel model =
                              context.read<CreateLearningSpaceViewModel>();
                          if (newValue) {
                            model.addCategory(category.categoryName);
                          } else {
                            model.removeCategory(category.categoryName);
                          }
                        },
                      );
                    }).toList()),
          )
        ],
      );
}

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
    super.key,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          onChanged(!value);
        },
        child: Padding(
          padding: padding,
          child: Row(
            children: <Widget>[
              Expanded(child: Text(label)),
              Checkbox(
                value: value,
                onChanged: (bool? newValue) {
                  onChanged(newValue!);
                },
              ),
            ],
          ),
        ),
      );
}

class Category {
  const Category({required this.categoryName});
  final String categoryName;
}
