import 'package:dog_pictures/dogs/dog_breeds/domain/state_notifiers/dog_breeds_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DogBreedsDropdown extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // Listen to the state for dog breeds. Whenever it changes, this
    // build method will automatically be called again, hence making sure
    // that the latest state is always rendered
    final state = useProvider(dogBreedsStateProvider);
    return DropdownButton<String>(
      hint: const Text(
        "Choose a dog breed!",
        style: _textStyle,
      ),
      items: state.data?.breeds.map(_dropdownItem).toList(),
      isExpanded: true,
      value: state.selectedBreed,
      // Read the notifier of the provider to pass on events from the user,
      // in this case, the user selects a dog breed from the dropdown
      onChanged:
          context.read(dogBreedsStateProvider.notifier).updateSelectedBreed,
      key: const Key("dog_breeds_dropdown_button"),
    );
  }

  DropdownMenuItem<String> _dropdownItem(String breed) {
    return DropdownMenuItem(
      value: breed,
      child: Text(
        breed,
        style: _textStyle,
      ),
    );
  }
}

const _textStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
);
