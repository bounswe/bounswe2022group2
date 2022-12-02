import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../core/extensions/context/context_extensions.dart';
import '../../../product/constants/icon_keys.dart';
import '../../../product/theme/dark_theme.dart';
import '../view-model/search_view_model.dart';

part '../components/user_preview.dart';

class SearchScreen extends BaseView<SearchViewModel> {
  const SearchScreen({Key? key})
      : super(
          builder: _builder,
          scrollable: true,
          hasScaffold: false,
          key: key,
        );

  static Widget _builder(BuildContext context) {
    final List<UserPreview> listOfUsers = <UserPreview>[
      const UserPreview(
          userName: "Altay Akar", profilePhoto: IconKeys.profilePageAltay),
      const UserPreview(
          userName: "Bahrican Kırmızı",
          profilePhoto: IconKeys.profilePageBahrican),
      const UserPreview(
          userName: "Batuhan Nikel", profilePhoto: IconKeys.profilePageBatuhan),
      const UserPreview(
          userName: "Ezgi Doğu", profilePhoto: IconKeys.profilePageEzgi),
      const UserPreview(
          userName: "Ecenur Sezar", profilePhoto: IconKeys.profilePageEce),
      const UserPreview(
          userName: "Egemen Yavaş", profilePhoto: IconKeys.profilePageEgemen),
      const UserPreview(
          userName: "Enes Sürmesiz", profilePhoto: IconKeys.profilePageEnes),
      const UserPreview(
          userName: "Hasan Askerol", profilePhoto: IconKeys.profilePageHasan),
      const UserPreview(
          userName: "Onur Karboncu", profilePhoto: IconKeys.profilePageOnur),
      const UserPreview(
          userName: "Gökay Güneş", profilePhoto: IconKeys.profilePageGokay),
      const UserPreview(
          userName: "Koray Tekçık", profilePhoto: IconKeys.profilePageKoray),
    ];

    return Padding(
      padding: EdgeInsets.only(
          left: context.width * 4,
          top: context.height * 1,
          bottom: context.height * 3,
          right: context.width * 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GridView.builder(
              physics: const ScrollPhysics(),
              itemCount: 11,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) =>
                  listOfUsers[index]),
        ],
      ),
    );
  }
}
