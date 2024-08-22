class TimePresenter {
  static String secondsToTime(int counter, {bool showHours = true}) {
    int hours = counter ~/ 3600;
    int minutes = (counter % 3600) ~/ 60;
    int seconds = counter % 60;

    String hoursStr = hours.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');

    if (!showHours) {
      return '$minutesStr:$secondsStr';
    }
    return '$hoursStr:$minutesStr:$secondsStr';
  }
}
