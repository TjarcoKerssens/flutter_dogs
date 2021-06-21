import 'dart:math';

import 'package:dog_pictures/dogs/dog_breeds/data/repositories/dog_breeds_repository.dart';
import 'package:dog_pictures/dogs/dog_breeds/domain/states/dog_breeds_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dogBreedsStateProvider =
    StateNotifierProvider<DogBreedsStateNotifier, DogBreedsState>(
  (ref) {
    return DogBreedsStateNotifier(ref.read);
  },
);

class DogBreedsStateNotifier extends StateNotifier<DogBreedsState> {
  // Inject the reader to use other providers
  final Reader _read;

  DogBreedsStateNotifier(this._read) : super(DogBreedsState.loading()) {
    _init();
  }

  // Load the data into the state
  Future<void> _init() async {
    try {
      final breeds = await _read(dogBreedsRepositoryProvider).fetchBreeds();
      // choose a random breed as the initially  selected one! :D
      final selectedBreed =
          breeds.breeds[Random().nextInt(breeds.breeds.length)];
      state = DogBreedsState(
        data: breeds,
        selectedBreed: selectedBreed,
      );
    } catch (e) {
      // for this example, we simply catch all errors with a
      // default message
      state = DogBreedsState.error();
    }
  }

  void updateSelectedBreed(String? breed) {
    state = state.copyWith(selectedBreed: breed);
  }
}
