import 'package:dota_assistant/screens/assistant.dart';
import 'package:dota_assistant/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dota Assistant',
      theme: dotaTheme,
      home: const Assistant(title: 'Dota Assistant'),
    );
  }
}
