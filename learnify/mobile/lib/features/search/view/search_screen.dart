import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../view-model/search_view_model.dart';

class SearchScreen extends BaseView<SearchViewModel> {
  const SearchScreen({Key? key})
      : super(
          builder: _builder,
          scrollable: true,
          hasScaffold: false,
          key: key,
        );

  static Widget _builder(BuildContext context) =>
      const Center(child: Text('Search'));
}
