import 'package:dota_assistant/utilities/constants.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final void Function() onStart;

  const StartScreen({required this.onStart, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: onStart,
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(60),
          ),
          child: const Text(
            'Start game',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
