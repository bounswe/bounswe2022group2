part of '../search_screen.dart';

class LSSearchResultWidget extends StatelessWidget {
  const LSSearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      SelectorHelper<List<LearningSpace>, SearchViewModel>().builder(
          (_, SearchViewModel model) => model.resultLearningSpaces,
          (BuildContext context, List<LearningSpace> resultLearningSpaces,
                  Widget? child) =>
              Padding(
                  padding: EdgeInsets.only(
                      left: context.width * 1,
                      top: context.height * 2,
                      bottom: context.height * 3,
                      right: context.width * 1),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (resultLearningSpaces.length ==
                            context
                                .read<SearchViewModel>()
                                .recommendedLearningSpaces
                                .length)
                          _recommendedMessage(
                              context, TextKeys.recommendedLearningSpaces),
                        if (resultLearningSpaces.length ==
                            context
                                .read<SearchViewModel>()
                                .recommendedLearningSpaces
                                .length)
                          context.sizedH(.8),
                        GridView.builder(
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
                            learningSpace: resultLearningSpaces[index],
                          ),
                        )
                      ])));

  static Widget _recommendedMessage(BuildContext context, String key) => Center(
        child: BaseText(key,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            )),
      );
}
