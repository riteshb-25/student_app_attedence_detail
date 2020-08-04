import 'package:flutter/material.dart';
import 'package:student_app_attedence_detail/Widgets/slotWidget.dart';

class Monday extends StatefulWidget {
  @override
  _MondayState createState() => _MondayState();
}

class _MondayState extends State<Monday> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
              scrollDirection: Axis.vertical,
              children: List.generate(7, (index) => SlotWidget())),
        ),
      ],
    );
  }
}
