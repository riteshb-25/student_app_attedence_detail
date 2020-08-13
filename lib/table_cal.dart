import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel, WeekdayFormat;
import 'package:intl/intl.dart' show DateFormat;

class TabCal extends StatefulWidget {
  final Function add;
  final EventList<Event> markedDatesMap;

  const TabCal({Key key, this.add, this.markedDatesMap}) : super(key: key);

  @required
  _TabCal createState() => _TabCal(add);
}

class _TabCal extends State<TabCal> {
  Function add;
  _TabCal(this.add);
  DateTime _currentDate = DateTime.now();
  String _currentMonth = DateFormat.yMMM().format(DateTime.now());
  DateTime _targetDateTime = DateTime.now();

  CalendarCarousel _calendarCarousel;

  @override
  Widget build(BuildContext context) {
    /// Example with custom icon
    _calendarCarousel = CalendarCarousel<Event>(
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate = date);
        events.forEach((event) => print(event.title));
      },
      inactiveWeekendTextStyle: TextStyle(color: Colors.red),
      //showOnlyCurrentMonthDate: true,
      //markedDateWidget: ,
      weekendTextStyle: TextStyle(color: Colors.black),
      thisMonthDayBorderColor: Colors.brown,
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
      weekDayFormat: WeekdayFormat.short,
      firstDayOfWeek: DateTime.saturday,
      staticSixWeekFormat: false,
      showWeekDays: false,
      showHeader: false,
      weekFormat: false,
      markedDatesMap: widget.markedDatesMap,
      height: 300,
      selectedDateTime: _currentDate,
      targetDateTime: _targetDateTime,
      showIconBehindDayText: true,
      markedDateIconBuilder: (event) {
        return event.icon;
      },
      daysHaveCircularBorder: null,
      todayBorderColor: Colors.green,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      selectedDayTextStyle: TextStyle(
        color: Colors.yellow,
      ),
      todayTextStyle: TextStyle(
        color: Colors.blue,
      ),
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      todayButtonColor: Colors.transparent,
      markedDateShowIcon: true,
      onDayLongPressed: (DateTime date) {
        add(date);
      },
    );

    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
//            margin: EdgeInsets.only(
//              top: 8.0,
//              bottom: 8.0,
//              left: 16.0,
//              right: 16.0,
//            ),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey[300],
                    ),
                    onPressed: () {
                      setState(() {
                        _targetDateTime = DateTime(
                            _targetDateTime.year, _targetDateTime.month - 1);
                        _currentMonth =
                            DateFormat.yMMM().format(_targetDateTime);
                      });
                    },
                  ),
                ),
                Expanded(
                    child: Text(
                  _currentMonth,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                )),
                Expanded(
                  child: FlatButton(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey[300],
                    ),
                    onPressed: () {
                      setState(() {
                        _targetDateTime = DateTime(
                            _targetDateTime.year, _targetDateTime.month + 1);
                        _currentMonth =
                            DateFormat.yMMM().format(_targetDateTime);
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Mon'),
                Text('Tue'),
                Text('Wed'),
                Text('Thu'),
                Text('Fri')
              ],
            ),
          ),
          Divider(
            thickness: 2.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: _calendarCarousel,
          ), //
        ],
      ),
    ); //
  }
}
