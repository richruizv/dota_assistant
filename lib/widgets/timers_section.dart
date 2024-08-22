import 'dart:async';
import 'package:dota_assistant/presenters/time_presenter.dart';
import 'package:dota_assistant/utilities/constants.dart';
import 'package:flutter/material.dart';

class TimersSection extends StatefulWidget {
  const TimersSection({super.key});

  @override
  State<TimersSection> createState() => _TimersSectionState();
}

class _TimersSectionState extends State<TimersSection> {
  Timer? _timer;

  int _counter = 0;
  int _tormentorTimer = tormentorInterval;
  int _experienceRuneTimer = experienceRuneInterval;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _counter++;

        if (_counter % tormentorInterval == 0) {
          _tormentorTimer = tormentorInterval;
        } else {
          _tormentorTimer--;
        }

        if (_counter % experienceRuneInterval == 0) {
          _experienceRuneTimer = experienceRuneInterval;
        } else {
          _experienceRuneTimer--;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _elapsedTimeWidget(),
        _tormentorCounter(),
        _experienceRuneCounter(),
      ],
    );
  }

  Widget _elapsedTimeWidget() {
    return Column(children: [
      const Text('Tiempo transcurrido', style: TextStyle(fontSize: 20)),
      const SizedBox(height: 10),
      Text(TimePresenter.secondsToTime(_counter),
          style: const TextStyle(fontSize: 24)),
    ]);
  }

  Widget _tormentorCounter() {
    return ListTile(
      leading: const Icon(Icons.how_to_vote),
      title: const Text('Siguiente Tormentor'),
      subtitle:
          Text(TimePresenter.secondsToTime(_tormentorTimer, showHours: false)),
    );
  }

  Widget _experienceRuneCounter() {
    return ListTile(
      leading: const Text('XP',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      title: const Text('Siguente runa de exp.'),
      subtitle: Text(
          TimePresenter.secondsToTime(_experienceRuneTimer, showHours: false)),
    );
  }
}
