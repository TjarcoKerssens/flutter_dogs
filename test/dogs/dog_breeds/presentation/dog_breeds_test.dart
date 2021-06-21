import 'package:dog_pictures/dogs/dog_breeds/data/repositories/dog_breeds_repository.dart';
import 'package:dog_pictures/dogs/dog_breeds/presentation/dog_breeds_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/mock_dog_breeds_repository.dart';

void main() {
  testWidgets('The Dog Breeds Dropdown renders the breeds',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          // We override the repository with our mock repository. The whole
          // domain layer will stay the same, it will just get its data
          // from the mock repository now.
          dogBreedsRepositoryProvider.overrideWithProvider(
            Provider((_) => MockDogBreedsRepository()),
          ),
        ],
        child: MaterialApp(
          home: Scaffold(body: DogBreedsDropdown()),
        ),
      ),
    );

    // make sure everything is rendered
    await tester.pump(const Duration(milliseconds: 500));

    const dropdownKey = Key("dog_breeds_dropdown_button");
    DropdownButton<String> getDropdown() =>
        find.byKey(dropdownKey).evaluate().single.widget
            as DropdownButton<String>;

    final dropdownButton = getDropdown();

    // Verify that breeds are rendered in the dropdown
    expect(dropdownButton.items, isNotEmpty);

    // Change the breed
    const updatedBreed = "samoyed";
    dropdownButton.onChanged!(updatedBreed);
    await tester.pump(const Duration(milliseconds: 200));

    final updatedDropdownButton = getDropdown();

    // Validate that the breed is indeed updated and thus the state notifier
    // works as expected
    expect(updatedDropdownButton.value, equals(updatedBreed));
  });
}
