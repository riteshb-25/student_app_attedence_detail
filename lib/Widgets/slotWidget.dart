import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_app_attedence_detail/course_detail.dart';

class SlotWidget extends StatefulWidget {
  @override
  _SlotWidgetState createState() => _SlotWidgetState();
}

class _SlotWidgetState extends State<SlotWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      height: 90.0,
      decoration: new BoxDecoration(
          color: Colors.white,
          boxShadow: [
            //background co// lor of box
            BoxShadow(
              color: Colors.deepPurple[200], //extend the shadow
              blurRadius: 2,
              spreadRadius: 0,
              offset: Offset(
                0, // Move to right 10  horizontally
                2.5, // Move to bottom 10 Vertically
              ),
            )
          ],
          borderRadius: BorderRadius.circular(4)),
      padding: EdgeInsets.fromLTRB(10, 10, 7, 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[Text("8:00"), Text("AM"), Text("9:00")],
            ),
          ),
          Container(
            height: 60,
            width: 2,
            color: Colors.grey[200],
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("ED9109"),
                Text("Introduction "),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "A SLOT",
                      style: TextStyle(color: Colors.red, fontSize: 10),
                    ),
                    SizedBox(
                      width: 1.5,
                    ),
                    Container(
                      height: 3,
                      width: 3,
                      decoration: BoxDecoration(
                          color: Colors.black, shape: BoxShape.circle),
                    ),
                    SizedBox(
                      width: 1.5,
                    ),
                    Text(
                      "THEORY",
                      style: TextStyle(color: Colors.grey[700], fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 60,
            width: 2,
            color: Colors.grey[200],
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 6),
                Text(
                  "07",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(flex: 1, child: Text("Leaves Left")),
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: 10,
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CourseDetail(),
                                  ));
                            },
                            child: Text(
                              "DETAILS",
                              style: TextStyle(
                                  color: Colors.deepPurple[400], fontSize: 10),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
