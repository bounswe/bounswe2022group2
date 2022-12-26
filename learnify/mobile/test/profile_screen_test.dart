/*import 'package:flutter_test/flutter_test.dart';
import 'package:learnify/core/managers/local/local_manager.dart';
import 'package:learnify/core/widgets/buttons/action_button.dart';
import 'package:learnify/core/widgets/text-field/custom_text_form_field.dart';
import 'package:learnify/features/auth/verification/model/user_model.dart';
import 'package:learnify/features/home-wrapper/view/home_wrapper_screen.dart';
import 'package:learnify/features/profile/constants/widget_keys.dart';
import 'package:learnify/features/profile/view/profile_screen.dart';
import 'package:learnify/product/constants/storage_keys.dart';

import 'test_helpers.dart';

void main() {
  testWidgets(
    "Tests profile screen when an invalid username is entered.",
    (WidgetTester tester) async {
      final User user = User(
        code: '1234',
        createdAt: DateTime.now().subtract(const Duration(seconds: 50)),
        email: 'hasanarisan@gmail.com',
        id: '1',
        isVerified: true,
        updatedAt: DateTime.now(),
      );
      await LocalManager.instance.setModel(user, StorageKeys.user);
      final HomeWrapper homeWrapper = HomeWrapper(initialIndex: 3);
      await tester.pumpWidget(TestHelpers.appWidget(homeWrapper));

      final Finder profileFinder = find.descendant(
          of: find.byWidget(homeWrapper), matching: find.byType(ProfileScreen));
      final ProfileScreen profileScreen =
          tester.widget(profileFinder) as ProfileScreen;
      expect(profileFinder, findsOneWidget);

      final Finder updateButtonFinder = TestHelpers.descendantFinderByKey(
          profileScreen, ProfileKeys.updateButton);
      expect(updateButtonFinder, findsOneWidget);
      ActionButton updateButton =
          tester.widget(updateButtonFinder) as ActionButton;

      final Finder enrolledButtonFinder = TestHelpers.descendantFinderByKey(
          profileScreen, ProfileKeys.enrolledLearningSpacesButton);
      expect(enrolledButtonFinder, findsOneWidget);

      final Finder createdButtonFinder = TestHelpers.descendantFinderByKey(
          profileScreen, ProfileKeys.createdLearningSpacesButton);
      expect(createdButtonFinder, findsOneWidget);

      final Finder usernameFormFinder = TestHelpers.descendantFinderByKey(
          profileScreen, ProfileKeys.usernameField);
      expect(usernameFormFinder, findsOneWidget);

      final Finder biographyFormFinder = TestHelpers.descendantFinderByKey(
          profileScreen, ProfileKeys.biographyField);
      expect(biographyFormFinder, findsOneWidget);

      expect(updateButton.isActive, false);

      final CustomTextFormField usernameField =
          tester.widget(usernameFormFinder) as CustomTextFormField;
      usernameField.controller?.text = 'ex';

      await tester.pumpAndSettle();
      updateButton = tester.widget(updateButtonFinder) as ActionButton;
      expect(updateButton.isActive, true);

      usernameField.controller?.text = 'hasanarisan';

      await tester.pumpAndSettle();
      updateButton = tester.widget(updateButtonFinder) as ActionButton;
      expect(updateButton.isActive, true);
    },
  );
}*/
