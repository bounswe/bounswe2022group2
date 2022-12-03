part of '../search_screen.dart';

class SearchResultWidget extends StatefulWidget {
  const SearchResultWidget({Key? key}) : super(key: key);

  @override
  State<SearchResultWidget> createList() => _SearchResultState();
}

class _SearchResultState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) => SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, int i) => GridView.builder(
            physics: const ScrollPhysics(),
            itemCount:
                context.read<SearchViewModel>().resultLearningSpaces.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) => CoursePreview(
              textKey: context
                      .read<SearchViewModel>()
                      .resultLearningSpaces[index]
                      .title ??
                  '',
              participantNumber: context
                      .read<SearchViewModel>()
                      .resultLearningSpaces[index]
                      .numParticipants ??
                  0,
            ),
          ),
          childCount: 1,
        ),
      );
}
