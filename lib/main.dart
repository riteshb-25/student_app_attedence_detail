import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'course_title.dart';
import 'table_cal.dart';
import 'leave_data.dart';

void main() {
  runApp(MaterialApp(
    home: CourseDetail(),
  ));
}

class CourseDetail extends StatefulWidget {
  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  String courseID = 'ED5017';
  String courseName = 'Digital Signal Processing';
  int leaveAllowed = 8;
  static var absent = 0;
  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {},
  );
  static Widget _eventIcon = new Container(
    decoration: new BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(1500)),
        border: Border.all(color: Colors.transparent, width: 2.0)),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              courseTitle(courseID, courseName),
              leavesData(leaveAllowed, absent),
              //SizedBox(height: 50,),
              Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TabCal(
                                markedDatesMap: _markedDateMap,
                                add: (DateTime date) {
                                  setState(() {
                                    _markedDateMap.add(
                                        date,
                                        new Event(
                                          date: date,
                                          title: 'Eve $date',
                                          icon: _eventIcon,
                                        ));
                                    absent++;
                                  });
                                },
                              )
                              /*Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 1, horizontal: 16),
                                  child: TabCal(
                                    
                                  ))*/
                            ]),
                      ),
                    ]),
              ),
              //SizedBox(height: 300,),
              Text(
                'Long press a date to mark/unmark absent',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
