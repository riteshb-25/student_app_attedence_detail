//Instead of Function present at 532 Line place this function inorder to remove saturday and sunday

AnimatedBuilder builder(int slideIndex) {
    _startWeekday = _dates[slideIndex].weekday - firstDayOfWeek;
    if (_startWeekday == 7) {
      _startWeekday = 0;
    }
    if (_startWeekday < 0) {
      _startWeekday *= -1;
      _startWeekday = 7 - _startWeekday;
    }
    _endWeekday =
        DateTime(_dates[slideIndex].year, _dates[slideIndex].month + 1, 1)
                .weekday -
            firstDayOfWeek;
    if (_endWeekday < 0) {
      _endWeekday *= -1;
      _endWeekday = 7 - _endWeekday;
    }
    double screenWidth = MediaQuery.of(context).size.width;
    int totalItemCount = widget.staticSixWeekFormat
        ? 42
        : DateTime(
              _dates[slideIndex].year,
              _dates[slideIndex].month + 1,
              0,
            ).day +
            _startWeekday +
            (7 - _endWeekday);
    totalItemCount = (totalItemCount ~/ 7) * 5;
    int year = _dates[slideIndex].year;
    int month = _dates[slideIndex].month;
    int index1 = 0;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        double value = 1.0;
        if (_controller.position.haveDimensions) {
          value = _controller.page - slideIndex;
          value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
        }

        return Center(
          child: SizedBox(
            height: Curves.easeOut.transform(value) * widget.height,
            width: Curves.easeOut.transform(value) * screenWidth,
            child: child,
          ),
        );
      },
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: GridView.count(
                physics: widget.customGridViewPhysics,
                crossAxisCount: 5,
                childAspectRatio: widget.childAspectRatio,
                padding: EdgeInsets.zero,
                children: List.generate(totalItemCount,

                    /// last day of month + weekday
                    (index) {
                  index = index + index1;

                  bool isPrevMonthDay = index < _startWeekday;
                  bool isNextMonthDay = index >=
                      (DateTime(year, month + 1, 0).day) + _startWeekday;
                  bool isThisMonthDay = !isPrevMonthDay && !isNextMonthDay;

                  DateTime now = DateTime(year, month, 1);
                  TextStyle textStyle;
                  TextStyle defaultTextStyle;
                  if (isPrevMonthDay && !widget.showOnlyCurrentMonthDate) {
                    now = now.subtract(Duration(days: _startWeekday - index));
                    if (now.weekday == DateTime.saturday) {
                      index1 = index1 + 2;
                      now = now.add(Duration(days: 2));
                    } else if (now.weekday == DateTime.sunday) {
                      index1 = index1 + 1;
                      now = now.add(Duration(days: 1));
                    }
                  } else if (isThisMonthDay) {
                    now = DateTime(year, month, index + 1 - _startWeekday);
                    if (now.weekday == DateTime.saturday) {
                      index1 = index1 + 2;
                      now = now.add(Duration(days: 2));
                    } else if (now.weekday == DateTime.sunday) {
                      index1 = index1 + 1;
                      now = now.add(Duration(days: 1));
                    }
                  } else if (!widget.showOnlyCurrentMonthDate) {
                    now = DateTime(year, month, index + 1 - _startWeekday);
                    if (now.weekday == DateTime.saturday) {
                      index1 = index1 + 2;
                      now = now.add(Duration(days: 2));
                    } else if (now.weekday == DateTime.sunday) {
                      index1 = index1 + 1;
                      now = now.add(Duration(days: 1));
                    }
                  } else {
                    return Container();
                  }

                  bool isSelectedDay = widget.selectedDateTime != null &&
                      widget.selectedDateTime.year == now.year &&
                      widget.selectedDateTime.month == now.month &&
                      widget.selectedDateTime.day == now.day;
                  bool isToday = DateTime.now().day == now.day &&
                      DateTime.now().month == now.month &&
                      DateTime.now().year == now.year;

                  if (now.month == (month - 1) &&
                      !widget.showOnlyCurrentMonthDate) {
                    textStyle = widget.prevDaysTextStyle;
                    defaultTextStyle = defaultPrevDaysTextStyle;
                  } else if (now.month == month) {
                    textStyle = isSelectedDay
                        ? widget.selectedDayTextStyle
                        : isToday
                            ? widget.todayTextStyle
                            : widget.daysTextStyle;
                    defaultTextStyle = isSelectedDay
                        ? defaultSelectedDayTextStyle
                        : isToday
                            ? defaultTodayTextStyle
                            : defaultDaysTextStyle;
                  } else {
                    textStyle = widget.nextDaysTextStyle;
                    defaultTextStyle = defaultNextDaysTextStyle;
                  }
                  if (widget.markedDateCustomTextStyle != null &&
                      widget.markedDatesMap != null &&
                      widget.markedDatesMap.getEvents(now).length > 0) {
                    textStyle = widget.markedDateCustomTextStyle;
                  }
                  isPrevMonthDay = (now.month == (month - 1));
                  isNextMonthDay = (now.month == (month + 1));
                  isThisMonthDay = !isPrevMonthDay && !isNextMonthDay;
                  bool isSelectable = true;
                  if (minDate != null &&
                      now.millisecondsSinceEpoch <
                          minDate.millisecondsSinceEpoch)
                    isSelectable = false;
                  else if (maxDate != null &&
                      now.millisecondsSinceEpoch >
                          maxDate.millisecondsSinceEpoch) isSelectable = false;
                  return renderDay(
                      isSelectable,
                      index,
                      isSelectedDay,
                      isToday,
                      isPrevMonthDay,
                      textStyle,
                      defaultTextStyle,
                      isNextMonthDay,
                      isThisMonthDay,
                      now);
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
