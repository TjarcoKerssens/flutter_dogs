import 'package:dog_pictures/dogs/dog_images/domain/states/dog_images_state.dart';
import 'package:dog_pictures/dogs/dog_images/domain/state_notifiers/dog_images_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DogImagesList extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final state = useProvider(dogImagesStateProvider);
    if (state.isLoading) {
      return _loading();
    }
    if (state.hasError) {
      return _error(state.errorMessage!);
    }

    return _content(state);
  }

  Widget _content(DogImagesState state) {
    final urls = state.images?.imageURLs ?? [];
    return ListView.builder(
      itemBuilder: (context, index) => Image.network(
        urls[index],
        errorBuilder: (context, _, __) => _imageError(),
      ),
      itemCount: urls.length,
      key: const Key("dog_images_list_view"),
    );
  }

  Widget _loading() => const Center(
        child: CircularProgressIndicator(),
      );

  Widget _error(String message) => Text(
        message,
        style: TextStyle(color: Colors.red[700], fontSize: 16),
      );

  Widget _imageError() => Container(
        height: 200,
        color: Colors.deepPurple[100],
      );
}
