import 'package:flutter/material.dart';

class Subject extends StatefulWidget {
  final String subjectname;
  final String classname;
  Subject({this.subjectname,this.classname});
  @override
  _SubjectState createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  String subjectname;
  String classname;
  @override
  void initState() {
      super.initState();
      subjectname = widget.subjectname;
      classname=widget.classname;
    }
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                subjectname
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                classname
              )
            ],
          )
          

        ],
      ),
      onPressed: ()=>{},
    );
  }
}