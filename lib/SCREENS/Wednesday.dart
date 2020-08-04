import 'package:flutter/material.dart';
import 'package:student_app_attedence_detail/Widgets/slotWidget.dart';

class Wednesday extends StatefulWidget {
  @override
  _WednesdayState createState() => _WednesdayState();
}

class _WednesdayState extends State<Wednesday> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
              scrollDirection: Axis.vertical,
              children: List.generate(4, (index) => SlotWidget())),
        ),
      ],
    );
  }
}
