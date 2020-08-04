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
      showOnlyCurrentMonthDate: true,
      weekendTextStyle: TextStyle(color: Colors.transparent),
      thisMonthDayBorderColor: Colors.brown,
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
      weekDayFormat: WeekdayFormat.short,
      firstDayOfWeek: DateTime.monday,
      showWeekDays: true,
      weekFormat: false,
      markedDatesMap: widget.markedDatesMap,
      height: 420.0,
      selectedDateTime: _currentDate,
      targetDateTime: _targetDateTime,
      showIconBehindDayText: true,
      markedDateWidget: Container(
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
            border: Border.all(color: Colors.transparent, width: 16.5)),
      ),
      /*markedDateIconBuilder: (event) {
        return event.icon;
      },*/
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
      markedDateShowIcon: false,
      onDayLongPressed: (DateTime date) {
        add(date);
      },
    );

    return Column(
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(
              top: 30.0,
              bottom: 16.0,
              left: 16.0,
              right: 16.0,
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: _calendarCarousel,
            ))
      ],
    ); //
  }
}
