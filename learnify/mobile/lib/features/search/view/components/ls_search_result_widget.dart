part of '../search_screen.dart';

class LSSearchResultWidget extends StatelessWidget {
  const LSSearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      SelectorHelper<List<LearningSpace>, SearchViewModel>().builder(
          (_, SearchViewModel model) => model.resultLearningSpaces,
          (BuildContext context, List<LearningSpace> resultLearningSpaces,
                  Widget? child) =>
              GridView.builder(
                physics: const ScrollPhysics(),
                itemCount: resultLearningSpaces.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) => CoursePreview(
                  textKey: resultLearningSpaces[index].title ?? '',
                  participantNumber:
                      resultLearningSpaces[index].numParticipants ?? 0,
                ),
              ));
}
