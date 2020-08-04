import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'course_title.dart';
import 'table_cal.dart';
import 'leave_data.dart';

class CourseDetail extends StatefulWidget {
  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  String courseID = 'ED5017';
  String courseName = 'Digital Signal Processing';
  int leaveAllowed = 8;
  static var absent = 0;
  EventList<Event> _markedDateMap = new EventList<Event>(events: {});
  List<DateTime> markDate = new List<DateTime>();
  static Widget _eventIcon = new Container(
    decoration: new BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(500.0)),
        border: Border.all(color: Colors.transparent, width: 3.0)),
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
                                    if (markDate.length == 0) {
                                      absent++;
                                      _markedDateMap.add(
                                          date,
                                          new Event(
                                            date: date,
                                            title: 'Eve $date',
                                            icon: _eventIcon,
                                          ));
                                      markDate.add(date);
                                    } else {
                                      if (markDate.contains(date)) {
                                        absent--;
                                        _markedDateMap.remove(
                                            date,
                                            new Event(
                                              date: date,
                                              title: 'Eve $date',
                                              icon: _eventIcon,
                                            ));
                                        markDate.remove(date);
                                      } else {
                                        absent++;
                                        _markedDateMap.add(
                                            date,
                                            Event(
                                              date: date,
                                              title: 'Eve $date',
                                              icon: _eventIcon,
                                            ));
                                        markDate.add(date);
                                      }
                                    }
                                  });
                                },
                              )
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