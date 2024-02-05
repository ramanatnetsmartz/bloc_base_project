import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<DateTime?> selectDate(
    BuildContext context, DateTime selectedDate, DateTime lastDate) async {
  return await showDatePicker(
    context: context,
    initialDatePickerMode: DatePickerMode.day,
    initialDate: selectedDate,
    builder: (BuildContext context, Widget? child) {
      return child!;
    },
    firstDate:
        selectedDate ?? DateTime.now().subtract(const Duration(days: 30)),
    lastDate: lastDate ?? DateTime.now().add(const Duration(days: 30)),
  );
}
