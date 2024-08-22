import 'package:dota_assistant/screens/end_screen.dart';
import 'package:dota_assistant/screens/game_screen.dart';
import 'package:dota_assistant/screens/start_screen.dart';
import 'package:flutter/material.dart';

class Assistant extends StatefulWidget {
  const Assistant({super.key, required this.title});

  final String title;

  @override
  State<Assistant> createState() => _AssistantState();
}

class _AssistantState extends State<Assistant> {
  Widget? _screen;
  String _activeScreen = 'start';

  @override
  Widget build(BuildContext context) {
    start() {
      setState(() {
        _activeScreen = 'game';
      });
    }

    switch (_activeScreen) {
      case 'start':
        _screen = StartScreen(onStart: start);
      case 'game':
        _screen = GameScreen(onPressEnd: () {
          setState(() {
            _activeScreen = 'end';
          });
        });
      case 'end':
        _screen = const EndScreen();
    }

    return _screen!;
  }
}
