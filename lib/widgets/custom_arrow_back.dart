import 'package:flutter/material.dart';

class customArrowBack extends StatelessWidget {
  const customArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.pop(context),
    );
  }
}
