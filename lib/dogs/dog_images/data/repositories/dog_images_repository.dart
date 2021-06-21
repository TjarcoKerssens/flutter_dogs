import 'package:dog_pictures/dogs/shared/data/dogs_api_client.dart';
import 'package:dog_pictures/dogs/dog_images/data/models/dog_images.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dogImagesRepositoryProvider = Provider<DogImagesRepository>((ref) {
  return DogImagesRepositoryImplementation(ref.read);
});

abstract class DogImagesRepository {
  Future<DogImages> fetchImages(String breed);
}

class DogImagesRepositoryImplementation extends DogImagesRepository {
  final Reader _read;

  DogImagesRepositoryImplementation(this._read);

  @override
  Future<DogImages> fetchImages(String breed) async {
    final endpoint = "breed/$breed/images/random/$_numberOfImages";
    final response = await _read(apiClientProvider).get(endpoint);
    return DogImages.fromJson(response.body);
  }
}

const _numberOfImages = 15;
