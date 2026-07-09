import 'package:flutter/material.dart';

class CalendarPickers {
  static Future<DateTime?> showCustomDatePicker(BuildContext context) {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
  }
}