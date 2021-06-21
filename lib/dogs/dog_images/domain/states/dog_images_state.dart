import 'package:dog_pictures/dogs/dog_images/data/models/dog_images.dart';

class DogImagesState {
  final DogImages? images;
  final bool isLoading;
  final bool hasError;

  // For simplicity of the example, we only have a single error message
  String? get errorMessage => hasError ? _errorMessage : null;

  DogImagesState({
    this.images,
    this.isLoading = false,
    this.hasError = false,
  });

  factory DogImagesState.loading() => DogImagesState(isLoading: true);
  factory DogImagesState.error() => DogImagesState(hasError: true);

  DogImagesState copyWith({
    DogImages? images,
    bool? isLoading,
    bool? hasError,
  }) {
    return DogImagesState(
      images: images ?? this.images,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
    );
  }
}

const _errorMessage =
    "Could not load images for this breed, please try another one";
