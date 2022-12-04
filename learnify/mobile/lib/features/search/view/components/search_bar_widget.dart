part of '../search_screen.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({Key? key}) : super(key: key);
  @override
  State<SearchBarWidget> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    final SearchViewModel model = context.read<SearchViewModel>();
    return SizedBox(
      width: context.width * 90,
      height: context.height * 7.5,
      child: TextField(
        keyboardType: TextInputType.text,
        controller: model.searchController,
        textInputAction: TextInputAction.search,
        onSubmitted: (String useless) {
          context.read<SearchViewModel>().search();
        },
        style: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
        cursorColor: Colors.black,
        decoration: InputDecoration(
          fillColor: Colors.transparent,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: LightAppTheme.cream,
            ),
          ),
          labelText: "Search",
          labelStyle: const TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          prefixIcon: IconButton(
            enableFeedback: false,
            icon: const Icon(
              Icons.search_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              context.read<SearchViewModel>().search();
              FocusManager.instance.primaryFocus?.unfocus();
            },
          ),
          suffixIcon: IconButton(
            onPressed: model.clearResultLearningSpaces,
            icon: const Icon(
              Icons.clear_outlined,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}
