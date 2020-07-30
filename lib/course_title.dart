import 'package:flutter/material.dart';

Widget courseTitle(String id, String name) {
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
      SizedBox(height: 4,),
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
