import 'package:dota_assistant/utilities/constants.dart';
import 'package:flutter/material.dart';

class EndScreen extends StatelessWidget {
  const EndScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      body: const Center(
        child: Text('End Screen'),
      ),
    );
  }
}
