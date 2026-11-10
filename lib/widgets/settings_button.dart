import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.settings),
      tooltip: 'My Settings',
      onPressed: () {
        Navigator.pushNamed(
          context,
          '/settings',
        );
      },
    );
  }
}