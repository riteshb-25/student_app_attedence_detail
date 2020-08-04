import 'package:flutter/material.dart';
import 'package:student_app_attedence_detail/Widgets/slotWidget.dart';

class Friday extends StatefulWidget {
  @override
  _FridayState createState() => _FridayState();
}

class _FridayState extends State<Friday> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
              scrollDirection: Axis.vertical,
              children: List.generate(1, (index) => SlotWidget())),
        ),
      ],
    );
  }
}
