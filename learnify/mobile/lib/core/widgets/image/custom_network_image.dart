import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../indicators/custom_loading_indicator.dart';

class CustomNetworkImage extends CachedNetworkImage {
  CustomNetworkImage(
    String url, {
    Key? key,
  }) : super(
          imageUrl: url,
          placeholder: (BuildContext context, _) =>
              CustomLoadingIndicator(context),
          key: key,
        );
}
