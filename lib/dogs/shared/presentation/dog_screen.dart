import 'package:dog_pictures/dogs/dog_breeds/domain/states/dog_breeds_state.dart';
import 'package:dog_pictures/dogs/dog_breeds/domain/state_notifiers/dog_breeds_state_notifier.dart';
import 'package:dog_pictures/dogs/dog_images/presentation/dog_images_list.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../dog_breeds/presentation/dog_breeds_dropdown.dart';

class DogsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dog pictures!")),
      body: ProviderListener(
        provider: dogBreedsStateProvider,
        onChange: _dogBreedsChangeListener,
        child: _body(context),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: Column(
        children: [
          DogBreedsDropdown(),
          Expanded(child: DogImagesList()),
        ],
      ),
    );
  }

  /// Listen to the dog breeds state to show an error when it is not possible
  /// to load data.
  ///
  /// With the [ProviderListener], we can listen to providers without triggering
  /// a rebuild of the underlying widgets. This can be very useful to show for
  /// example a snackbar
  void _dogBreedsChangeListener(BuildContext context, DogBreedsState state) {
    if (state.hasError) {
      final errorSnackBar = SnackBar(
        content: Text(state.errorMessage),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
    }
  }
}
