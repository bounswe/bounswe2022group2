import 'package:flutter/material.dart';

mixin CreateLearningSpaceKeys {
  static const Key titleField = Key('create_space_title_field');
  static const Key descriptionField = Key('create_space_description_field');
  static const Key participantsField = Key('create_space_participants_field');
  static const Key categoriesField = Key('create_space_categories_field');
}

mixin AddPostKeys {
  static const Key titleField = Key('add_post_title_field');
  static const Key contentField = Key('add_post_content_field');
}

mixin CreateEventKeys {
  static const Key titleField = Key('create_event_title_field');
  static const Key descriptionField = Key('create_event_description_field');
  static const Key participationLimitField =
      Key('create_event_participation_limit_field');
  static const Key durationField = Key('create_event_duration_field');
}
