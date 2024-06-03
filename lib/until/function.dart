import 'package:flutter/material.dart';

TimeOfDay parseTime(String timeStr) {
  final timeParts = timeStr.split(' ');
  final hourMinuteParts = timeParts[0].split(':');
  int hour = int.parse(hourMinuteParts[0]);
  int minute = int.parse(hourMinuteParts[1]);

  if (timeParts[1] == 'PM' && hour != 12) {
    hour += 12;
  } else if (timeParts[1] == 'AM' && hour == 12) {
    hour = 0;
  }

  return TimeOfDay(hour: hour, minute: minute);
}

bool isBranchOpen(String openingHours) {
  final now = TimeOfDay.now();
  final hours = openingHours.split(' - ');
  final openingTime = parseTime(hours[0]);
  final closingTime = parseTime(hours[1]);

  final nowMinutes = now.hour * 60 + now.minute;
  final openingMinutes = openingTime.hour * 60 + openingTime.minute;
  final closingMinutes = closingTime.hour * 60 + closingTime.minute;

  return nowMinutes >= openingMinutes && nowMinutes <= closingMinutes;
}