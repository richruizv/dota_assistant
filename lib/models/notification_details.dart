enum CustomNotificationDetails {
  tormentor(
    id: 'tormentor_notification',
    name: 'tormentor notification',
    description: 'Dota 2 tormentor notification',
    sound: 'tormentor_notification',
  ),
  other(
    id: 'other_notification',
    name: 'other notification',
    description: 'Dota 2 other notification',
    sound: null,
  ),
  ;

  final String id;
  final String name;
  final String description;
  final String? sound;

  const CustomNotificationDetails({
    required this.id,
    required this.name,
    required this.description,
    required this.sound,
  });
}
