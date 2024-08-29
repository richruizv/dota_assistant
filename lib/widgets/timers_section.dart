import 'dart:async';
import 'package:dota_assistant/models/notification_details.dart';
import 'package:dota_assistant/presenters/time_presenter.dart';
import 'package:dota_assistant/services/local_notifications_service.dart';
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

  int _tormentorTimer = firstTormentorInterval;
  bool _activeTormentor = false;

  bool _activeRoshan = true;
  int _roshanMinTimer = roshanMinInterval;
  int _roshanMaxTimer = roshanMaxInterval;

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

        if (_tormentorTimer == 0) {
          _tormentorTimer = secondTormentorInterval;
          LocalNotificationsService().showLocalNotification(
            title: 'Nuevo Tormentor',
            body: 'Vamos por el tormentor culos',
            details: CustomNotificationDetails.tormentor,
          );
          _activeTormentor = true;
        }

        if (!_activeTormentor) {
          _tormentorTimer--;
        }

        if (_roshanMinTimer == 0) {
          LocalNotificationsService().showLocalNotification(
              title: 'Roshan comienza', body: 'Roshan podria estar activo');
          _roshanMinTimer = roshanMinInterval;
        }

        if (_roshanMaxTimer == 0) {
          LocalNotificationsService().showLocalNotification(
              title: 'Roshan activo', body: 'Vamos por Roshan!');
          _roshanMaxTimer = roshanMaxInterval;
          _roshanMinTimer = roshanMinInterval;
          _activeRoshan = true;
        }

        if (!_activeRoshan) {
          _roshanMinTimer--;
          _roshanMaxTimer--;
        }

        if (_counter % experienceRuneInterval == 0) {
          LocalNotificationsService().showLocalNotification(
              title: 'Runa de experiencia',
              body: 'Vamos por la runa de experiencia');
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
        _roshanCounter(),
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
    if (_activeTormentor) {
      return ListTile(
        leading: const Icon(Icons.how_to_vote),
        title: const Text(
          'Tormentor activo',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        trailing: IconButton(
          onPressed: () {
            setState(() {
              _activeTormentor = false;
            });
          },
          icon: const Icon(Icons.done),
          tooltip: 'Tormentor completado',
        ),
      );
    } else {
      return ListTile(
        leading: const Icon(Icons.how_to_vote),
        title: const Text('Siguiente Tormentor'),
        subtitle: Text(
            TimePresenter.secondsToTime(_tormentorTimer, showHours: false)),
      );
    }
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

  Widget _roshanCounter() {
    if (_activeRoshan) {
      return ListTile(
        leading: const Icon(Icons.bug_report),
        title: const Text(
          'Roshan activo',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        trailing: IconButton(
          onPressed: () {
            setState(() {
              _activeRoshan = false;
            });
          },
          icon: const Icon(Icons.done),
          tooltip: 'Roshan completado',
        ),
      );
    } else {
      return ListTile(
        leading: const Icon(Icons.bug_report),
        title: const Text('Siguiente Roshan'),
        subtitle: Text(
            TimePresenter.secondsToTime(_roshanMaxTimer, showHours: false)),
      );
    }
  }
}
