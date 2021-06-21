import 'package:dog_pictures/dogs/dog_breeds/data/repositories/dog_breeds_repository.dart';
import 'package:dog_pictures/dogs/dog_images/data/repositories/dog_images_repository.dart';
import 'package:dog_pictures/dogs/dog_images/presentation/dog_images_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../dog_breeds/data/mock_dog_breeds_repository.dart';
import '../data/mock_dog_images_repository.dart';

void main() {
  test("Repo returns images", () async {
    final repo = MockDogImagesRepository();
    final images = await repo.fetchImages("");
    expect(images.imageURLs, isNotEmpty);
  });

  testWidgets('The Dog Breeds Images List is rendered',
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            // We override the repositories with our mock repositories. The whole
            // domain layer will stay the same, it will just get its data
            // from the mock repository now.
            dogBreedsRepositoryProvider.overrideWithProvider(
              Provider((_) => MockDogBreedsRepository()),
            ),
            dogImagesRepositoryProvider.overrideWithProvider(
              Provider((_) => MockDogImagesRepository()),
            ),
          ],
          child: MaterialApp(
            home: Scaffold(body: DogImagesList()),
          ),
        ),
      );

      // make sure everything is rendered
      await tester.pump(const Duration(milliseconds: 200));
      await tester.pump(const Duration(milliseconds: 200));
      const listKey = Key("dog_images_list_view");
      final listView = find.byKey(listKey).evaluate().single.widget as ListView;

      // Will render images
      final expectedImagesCount =
          listView.childrenDelegate.estimatedChildCount ?? 0;
      expect(expectedImagesCount > 0, true);
    });
  });
}
