import 'dart:convert';

import 'package:flutter/foundation.dart';

// The model classes are generated with the 'Dart Data Class Generator'
// VS code plugin. This makes it easy to generate classes that can be
// parsed from and to JSON based on the JSON in the data source (API in this case)
class DogBreeds {
  final List<String> breeds;

  DogBreeds({
    required this.breeds,
  });

  DogBreeds copyWith({
    List<String>? breeds,
  }) {
    return DogBreeds(
      breeds: breeds ?? this.breeds,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'breeds': breeds,
    };
  }

  factory DogBreeds.fromMap(Map<String, dynamic> map) {
    final breeds =
        Map<String, dynamic>.from(map["message"] as Map<dynamic, dynamic>);
    return DogBreeds(
      breeds: breeds.keys.toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory DogBreeds.fromJson(String source) =>
      DogBreeds.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DogBreeds(breeds: $breeds)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DogBreeds && listEquals(other.breeds, breeds);
  }

  @override
  int get hashCode => breeds.hashCode;
}
