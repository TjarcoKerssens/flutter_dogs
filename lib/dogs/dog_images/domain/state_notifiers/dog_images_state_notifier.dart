import 'package:dog_pictures/dogs/dog_images/data/repositories/dog_images_repository.dart';
import 'package:dog_pictures/dogs/dog_breeds/domain/state_notifiers/dog_breeds_state_notifier.dart';
import 'package:dog_pictures/dogs/dog_images/domain/states/dog_images_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dogImagesStateProvider =
    StateNotifierProvider<DogImagesStateNotifer, DogImagesState>((ref) {
  // watch for updates on the dog breeds state to rebuild this provider when
  // the selected breed changes
  final breedState = ref.watch(dogBreedsStateProvider);
  return DogImagesStateNotifer(ref.read, breedState.selectedBreed);
});

class DogImagesStateNotifer extends StateNotifier<DogImagesState> {
  final Reader _read;
  final String? selectedBreed;

  DogImagesStateNotifer(this._read, this.selectedBreed)
      : super(DogImagesState.loading()) {
    _init();
  }

  // Fetch the images based on the current selectedBreed
  Future<void> _init() async {
    if (selectedBreed != null) {
      try {
        final images = await _read(dogImagesRepositoryProvider)
            .fetchImages(selectedBreed!);
        state = DogImagesState(images: images);
      } catch (e) {
        // To simplify the example, we treat all the errors in the same way
        state = DogImagesState.error();
      }
    }
  }
}
