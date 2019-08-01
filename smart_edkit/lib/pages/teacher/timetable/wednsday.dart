import 'package:flutter/material.dart';
import 'package:sedkit/pages/teacher/timetable/utils/widgets.dart';

class WedPage extends StatefulWidget {
  @override
  _WedPageState createState() => _WedPageState();
}

class _WedPageState extends State<WedPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Subject(
            subjectname: 'Maths',
            classname: '7 D',
          )
        ],
      ),
    );
  }
}