import 'package:dog_pictures/dogs/dog_breeds/data/models/dog_breeds.dart';
import 'package:dog_pictures/dogs/dog_breeds/data/repositories/dog_breeds_repository.dart';

import '../../../assets/assets_reader.dart';

class MockDogBreedsRepository extends DogBreedsRepository {
  @override
  Future<DogBreeds> fetchBreeds() async {
    final jsonString = asset(_breedsAsset);
    return DogBreeds.fromJson(jsonString);
  }
}

const _breedsAsset = "dog_breeds.json";
