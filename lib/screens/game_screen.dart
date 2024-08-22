import 'package:dota_assistant/utilities/constants.dart';
import 'package:dota_assistant/widgets/timers_section.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  final void Function() onPressEnd;

  const GameScreen({required this.onPressEnd, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
        actions: [_endGameButton()],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: const SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TimersSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _endGameButton() {
    return ElevatedButton(
      onPressed: onPressEnd,
      child: const Text('Terminar'),
    );
  }
}
