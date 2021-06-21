import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'dogs/shared/presentation/dog_screen.dart';

void main() {
  runApp(
    ProviderScope(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vesper Architecture Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: DogsScreen(),
    );
  }
}
