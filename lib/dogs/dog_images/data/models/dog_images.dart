import 'dart:convert';

import 'package:flutter/foundation.dart';

class DogImages {
  List<String> imageURLs;
  DogImages({
    required this.imageURLs,
  });

  DogImages copyWith({
    List<String>? imageURLs,
  }) {
    return DogImages(
      imageURLs: imageURLs ?? this.imageURLs,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageURLs': imageURLs,
    };
  }

  factory DogImages.fromMap(Map<String, dynamic> map) {
    return DogImages(
      imageURLs: List<String>.from(map['message'] as List<dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory DogImages.fromJson(String source) =>
      DogImages.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DogImages(imageURLs: $imageURLs)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DogImages && listEquals(other.imageURLs, imageURLs);
  }

  @override
  int get hashCode => imageURLs.hashCode;
}
