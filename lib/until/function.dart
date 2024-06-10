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

String timeAgo(DateTime postedTime) {
  DateTime now = DateTime.now();
  Duration difference = now.difference(postedTime);

  if (difference.inDays >= 365) {
    int years = (difference.inDays / 365).floor();
    return '$years year(s) ago';
  } else if (difference.inDays >= 30) {
    int months = (difference.inDays / 30).floor();
    return '$months month(s) ago';
  } else if (difference.inDays >= 1) {
    return '${difference.inDays} day(s) ago';
  } else if (difference.inHours >= 1) {
    return '${difference.inHours} hour(s) ago';
  } else if (difference.inMinutes >= 1) {
    return '${difference.inMinutes} minute(s) ago';
  } else {
    return 'just now';
  }
}



bool isStoreClosed(String timeRange) {
  // Bước 1: Phân tích chuỗi thời gian
  List<String> times = timeRange.split(' - ');
  String openingTime = times[0];
  String closingTime = times[1];

  // Chuyển đổi giờ mở và giờ đóng thành TimeOfDay
  TimeOfDay openingTimeOfDay = TimeOfDay(
    hour: int.parse(openingTime.split(':')[0]),
    minute: int.parse(openingTime.split(':')[1]),
  );

  TimeOfDay closingTimeOfDay = TimeOfDay(
    hour: int.parse(closingTime.split(':')[0]),
    minute: int.parse(closingTime.split(':')[1]),
  );

  // Bước 2: Lấy thời gian hiện tại
  DateTime now = DateTime.now();

  // Chuyển đổi TimeOfDay thành DateTime để so sánh
  DateTime openingDateTime = DateTime(now.year, now.month, now.day, openingTimeOfDay.hour, openingTimeOfDay.minute);
  DateTime closingDateTime = DateTime(now.year, now.month, now.day, closingTimeOfDay.hour, closingTimeOfDay.minute);

  // Bước 3: So sánh thời gian hiện tại với giờ mở và giờ đóng
  if (now.isBefore(openingDateTime) || now.isAfter(closingDateTime)) {
    return true;  // Cửa hàng đã đóng cửa
  } else {
    return false; // Cửa hàng vẫn mở cửa
  }
}