part of '../../create_learning_space_screen.dart';

class _AddCategories extends StatefulWidget {
  const _AddCategories({Key? key}) : super(key: key);

  @override
  State<_AddCategories> createState() => _AddCategoriesWidgetState();
}

class Category {
  Category({required this.categoryName, this.isChecked = false});
  String categoryName;
  bool isChecked;
}

class _AddCategoriesWidgetState extends State<_AddCategories> {
  List<Category> categoryOptions = <Category>[
    Category(categoryName: "Art"),
    Category(categoryName: "Music"),
    Category(categoryName: "Dance"),
    Category(categoryName: "Cooking"),
    Category(categoryName: "Programming"),
    Category(categoryName: "Technology"),
    Category(categoryName: "Knitting"),
    Category(categoryName: "Science"),
    Category(categoryName: "Math"),
    Category(categoryName: "Coffee"),
    Category(categoryName: "Yoga"),
    Category(categoryName: "Sports"),
    Category(categoryName: "Acting"),
    Category(categoryName: "Writing"),
    Category(categoryName: "Board Games"),
    Category(categoryName: "Esports"),
    Category(categoryName: "Chess"),
    Category(categoryName: "Bartending"),
    Category(categoryName: "Baking"),
    Category(categoryName: "Magic"),
    Category(categoryName: "Astronomy"),
    Category(categoryName: "Fishing"),
    Category(categoryName: "Gardening"),
    Category(categoryName: "Hobbies"),
    Category(categoryName: "Outdoors"),
    Category(categoryName: "Educational"),
    Category(categoryName: "Photography"),
  ];

  @override
  Widget build(BuildContext context) => ExpansionTile(
        key: CreateLearningSpaceKeys.categoriesField,
        title: const BaseText(TextKeys.addCategoriesHint),
        children: <Widget>[
          Wrap(
              runSpacing: 5,
              spacing: 5,
              children: categoryOptions
                  .map((Category category) => LabeledCheckbox(
                        label: category.categoryName,
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        value: category.isChecked,
                        onChanged: (bool newValue) {
                          setState(() {
                            category.isChecked = newValue;
                            if (category.isChecked) {
                              _selectedCategories.add(category.categoryName);
                            } else {
                              _selectedCategories.remove(category.categoryName);
                            }
                          });
                        },
                      ))
                  .toList())
        ],
      );
}

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    super.key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
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
