import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';

class CleanCalendarExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Calendar(
      events: _events,
      showTodayIcon: false,
      isExpanded: true,
      showArrows: true,
      selectedColor: Colors.lightBlue
    );
  }

  final Map _events = {
    DateTime(2019, 3, 1): [
      {'name': 'Event A', 'isDone': true},
    ],
  };


}
