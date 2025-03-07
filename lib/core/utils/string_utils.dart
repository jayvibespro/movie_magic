import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart' as intl;

class StringUtils {
  static String greetingMessage() {
    final now = DateTime.now();
    final hour = now.hour;

    if (hour >= 5 && hour < 12) {
      return "Good morning";
    } else if (hour >= 12 && hour < 17) {
      return "Good afternoon";
    } else if (hour >= 17 && hour < 21) {
      return "Good evening";
    } else {
      return "Good night";
    }
  }

  static String formatDuration(int minutes) {
    int hours = minutes ~/ 60; // Get the number of hours
    int remainingMinutes = minutes % 60; // Get the remaining minutes

    String hoursStr = hours > 0 ? "${hours}h " : "";
    String minutesStr = remainingMinutes > 0 ? "${remainingMinutes}m" : "";

    return (hoursStr + minutesStr).trim();
  }

  static String getNameInitials(String fullName) {
    List<String> nameParts = fullName.split(" ");

    if (nameParts.length > 1) {
      String firstName = nameParts[0];
      String lastNameInitial = nameParts[1][0].toUpperCase();
      return '$firstName $lastNameInitial';
    } else {
      return fullName;
    }
  }

  static String dateFormatter(String? date) {
    if (date == null || date == "") {
      return "";
    }
    return intl.DateFormat(
      'EEE, d MMM yyy',
    ).format(DateTime.parse(date)).toString();
  }

  static String ymdDateFormatter(
    DateTime dateTime, {
    String? pattern = 'yyy-MM-dd',
  }) {
    return intl.DateFormat(pattern).format(dateTime).toString();
  }

  static String dateAndTime(DateTime dateTime) {
    return "${intl.DateFormat('yyy-MM-dd').format(dateTime)} ${intl.DateFormat('hh:mm a').format(dateTime)}";
  }

  static String to12HourFormat(String time24) {
    try {
      final parts = time24.split(":");
      if (parts.length != 2) {
        throw const FormatException("Invalid time format");
      }

      int hours = int.parse(parts[0]);
      int minutes = int.parse(parts[1]);

      if (hours < 0 || hours > 23 || minutes < 0 || minutes > 59) {
        throw const FormatException("Invalid time values");
      }

      final period = hours >= 12 ? "PM" : "AM";
      hours = hours % 12;
      if (hours == 0) hours = 12;

      return "$hours:${minutes.toString().padLeft(2, '0')} $period";
    } catch (e) {
      return time24;
    }
  }

  static String isoStringToDate(String isoString) {
    final dateTime = DateTime.parse(isoString);
    final dateFormat = intl.DateFormat('dd/MM/yyyy');
    return dateFormat.format(dateTime);
  }

  static String isoStringTime(String isoString) {
    final dateTime = DateTime.parse(isoString);
    final timeFormat = intl.DateFormat('hh:mm a');
    return timeFormat.format(dateTime);
  }

  static String toCurrency(int amount) {
    final formatter = RegExp(r'(\d)(?=(\d{3})+(?!\d))');
    return amount.toString().replaceAllMapped(
      formatter,
      (match) => "${match[1]},",
    );
  }
}
