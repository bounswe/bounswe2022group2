part of '../search_screen.dart';

class SearchResultWidget extends StatefulWidget {
  const SearchResultWidget({Key? key}) : super(key: key);

  @override
  State<SearchResultWidget> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResultWidget> {
  @override
  Widget build(BuildContext context) =>
      SelectorHelper<List<LearningSpace>, SearchViewModel>().builder(
          (_, SearchViewModel model) => model.resultLearningSpaces,
          (BuildContext context, List<LearningSpace> resultLearningSpaces,
                  Widget? child) =>
              resultLearningSpaces.isNotEmpty
                  ? GridView.builder(
                      physics: const ScrollPhysics(),
                      itemCount: resultLearningSpaces.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3, vertical: 10),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) =>
                          CoursePreview(
                        textKey: resultLearningSpaces[index].title ?? '',
                        participantNumber:
                            resultLearningSpaces[index].numParticipants ?? 0,
                      ),
                    )
                  : const Center(
                      child: Text("Recommended courses will be added!"),
                    ));
}
