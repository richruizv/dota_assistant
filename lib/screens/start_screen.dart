import 'package:dota_assistant/models/notification_details.dart';
import 'package:dota_assistant/services/local_notifications_service.dart';
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
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
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
            OutlinedButton(
              onPressed: () {
                LocalNotificationsService().showLocalNotification(
                    title: 'prueba tormentor',
                    body: 'prueba notification tormentor',
                    details: CustomNotificationDetails.tormentor);
              },
              child: const Text('prueba notificacion tormentor'),
            ),
          ],
        ),
      ),
    );
  }
}
