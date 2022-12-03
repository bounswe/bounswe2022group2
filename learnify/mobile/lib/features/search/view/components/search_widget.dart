part of '../search_screen.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) => SizedBox(
        width: context.width * 90,
        height: context.height * 7.5,
        child: TextField(
          keyboardType: TextInputType.text,
          controller: context.read<SearchViewModel>().searchController,
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
            //hintText: 'Search',
            //hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            labelText: "Search",
            labelStyle: const TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
            prefixIcon: IconButton(
              //padding: const EdgeInsets.all(5),
              //width: 10,
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
              onPressed: context.read<SearchViewModel>().searchController.clear,
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
