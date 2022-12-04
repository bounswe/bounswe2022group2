part of '../search_screen.dart';

class UserSearchResultWidget extends StatelessWidget {
  const UserSearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      SelectorHelper<List<UserPreview>, SearchViewModel>().builder(
          (_, SearchViewModel model) => model.resultUsers,
          (BuildContext context, List<UserPreview> resultUsers,
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
                        if (resultUsers.length != 1)
                          _recommendedMessage(context),
                        if (resultUsers.length != 1) context.sizedH(.8),
                        GridView.builder(
                            physics: const ScrollPhysics(),
                            itemCount: resultUsers.length,
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
                                resultUsers[index]),
                      ])));

  static Widget _recommendedMessage(BuildContext context) => const Center(
        child: Text("Recommended Users", //TextKeys.recommendedUsers,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            )),
      );
}
