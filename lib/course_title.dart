import 'package:flutter/material.dart';

class CourseTitle extends StatelessWidget {
  final String id;
  final String name;

  CourseTitle(this.id, this.name);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '$id',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          '$name',
          style: TextStyle(
            color: Colors.grey[600],
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
