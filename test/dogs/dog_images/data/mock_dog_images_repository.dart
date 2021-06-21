import 'package:dog_pictures/dogs/dog_images/data/models/dog_images.dart';
import 'package:dog_pictures/dogs/dog_images/data/repositories/dog_images_repository.dart';

import '../../../assets/assets_reader.dart';

class MockDogImagesRepository extends DogImagesRepository {
  @override
  Future<DogImages> fetchImages(String breed) async {
    final jsonString = asset(_imagesAsset);
    return DogImages.fromJson(jsonString);
  }
}

const _imagesAsset = "dog_breed_images.json";
