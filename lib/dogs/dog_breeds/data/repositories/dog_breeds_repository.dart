import 'package:dog_pictures/dogs/shared/data/dogs_api_client.dart';
import 'package:dog_pictures/dogs/dog_breeds/data/models/dog_breeds.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Define the provider with the abstract type [DogBreedsRepository] so we
/// can override it in our tests, but return the concrete implementation here
final dogBreedsRepositoryProvider = Provider<DogBreedsRepository>((ref) {
  return DogBreedsRepositoryImplementation(ref.read);
});

/// A repository is a class that is responsible for providing and/or saving data
/// Essentially, it is the logic component of the data layer. The data source
/// could be anything and *only* the data layer is concerned with actually
/// defining the data source. For example, for our tests, we inject a mock
/// [DogBreedsRepository] implementation that uses a cached JSON file
/// In this example, we do not save any data back to the API.
abstract class DogBreedsRepository {
  Future<DogBreeds> fetchBreeds();
}

class DogBreedsRepositoryImplementation extends DogBreedsRepository {
  final Reader _read;
  DogBreedsRepositoryImplementation(this._read);

  @override
  Future<DogBreeds> fetchBreeds() async {
    final response = await _read(apiClientProvider).get(_endpoint);
    return DogBreeds.fromJson(response.body);
  }
}

const _endpoint = "breeds/list/all";
