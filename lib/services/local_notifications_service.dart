import 'package:dota_assistant/models/notification_details.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationsService {
  static final LocalNotificationsService _instance =
      LocalNotificationsService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  factory LocalNotificationsService() {
    return _instance;
  }

  initializeNotifications() {
    const initializationSettingsAndroid =
        AndroidInitializationSettings('mipmap/ic_launcher');

    const initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
    // initialize the notifications
  }

  showLocalNotification({
    required String title,
    required String body,
    CustomNotificationDetails details = CustomNotificationDetails.other,
  }) async {
    final androidPlatformChannelSpecifics = AndroidNotificationDetails(
      details.id,
      details.name,
      channelDescription: details.description,
      importance: Importance.max,
      priority: Priority.high,
      sound: details.sound != null
          ? RawResourceAndroidNotificationSound(details.sound)
          : null,
    );

    final platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
    );
  }

  LocalNotificationsService._internal() {
    initializeNotifications();
  }
}
