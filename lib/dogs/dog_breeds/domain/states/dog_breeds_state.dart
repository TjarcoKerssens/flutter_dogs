import 'package:dog_pictures/dogs/dog_breeds/data/models/dog_breeds.dart';

/// The state object is used to instruct the presentation layer what to render
///
/// Note that we make all the properties inmutable with the `final` keyword.
/// This ensures that only the state notifier ([DogBreedsStateNotifier]) can
/// actually perform updates on this state.
class DogBreedsState {
  final DogBreeds? data;
  final String? selectedBreed;
  final bool isLoading;
  final bool hasError;

  String get errorMessage => _errorMessage;

  DogBreedsState({
    this.data,
    this.selectedBreed,
    this.isLoading = false,
    this.hasError = false,
  });

  factory DogBreedsState.loading() => DogBreedsState(isLoading: true);
  factory DogBreedsState.error() => DogBreedsState(hasError: true);

  DogBreedsState copyWith({
    DogBreeds? data,
    String? selectedBreed,
    bool? isLoading,
    bool? hasError,
  }) {
    return DogBreedsState(
      data: data ?? this.data,
      selectedBreed: selectedBreed ?? this.selectedBreed,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
    );
  }
}

const _errorMessage =
    "Could not load the dog breeds, do you have an internet connection?";
