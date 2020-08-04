import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'SCREENS/Friday.dart';
import 'SCREENS/Monday.dart';
import 'SCREENS/Thursday.dart';
import 'SCREENS/Tuesday.dart';
import 'SCREENS/Wednesday.dart';
import 'Widgets/customButton.dart';
import 'add_course.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calender',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController = PageController();

  static int dayofweek = DateTime.now().weekday;
  int diffToMon;
  int day = DateTime.now().day;

  double currentPage;

  void currentDate() {
    setState(() {
      if (dayofweek == 6) {
        day = day + 2;
      } else if (dayofweek == 7) {
        day = day + 1;
      } else {
        diffToMon = dayofweek % 7 - 1;
        day = day - diffToMon;
      }
      currentPage = (dayofweek - 1).toDouble();
    });
  }

  @override
  void initState() {
    super.initState();
    currentDate();
    pageController = PageController(initialPage: currentPage.toInt());
  }

  @override
  Widget build(BuildContext context) {
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page;
      });
    });
//    List<dateWidget> dates = List.generate(5, (index) => dateWidget(index: index, day: day ));
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(27, 0, 27, 0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(child: Text("SCHEDULE")),
                SizedBox(
                  height: 2,
                ),
                Center(
                    child: Text(DateFormat.MMMM().format(DateTime.now()) +
                        " " +
                        DateTime.now().year.toString())),
                SizedBox(
                  height: 5,
                ),
                Container(
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: Colors.deepPurpleAccent,
                    ),
                    padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: dateWidget(context)),
                Expanded(
                  child: PageView(
                    controller: pageController,
                    children: <Widget>[
                      Monday(),
                      Tuesday(),
                      Wednesday(),
                      Thursday(),
                      Friday()
                    ],
                  ),
                ),
              ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(child: AddCourse());
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget dateWidget(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 1,
            child: CustomButton(
              color: currentPage < 0.5 && currentPage < 1 ? Colors.white : null,
              onPressed: () {
                pageController.animateToPage(0,
                    duration: Duration(milliseconds: 100),
                    curve: Curves.bounceInOut);
              },
              textColor: currentPage < 0.5 && currentPage < 1
                  ? Colors.black
                  : Colors.white,
              buttonText1: "Mon",
              buttonText2: "${day + 0}",
              index: 0,
            )),
        SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 1,
            child: CustomButton(
              color:
                  currentPage >= 1 && currentPage < 1.5 ? Colors.white : null,
              onPressed: () {
                pageController.animateToPage(1,
                    duration: Duration(milliseconds: 100),
                    curve: Curves.bounceInOut);
              },
              textColor: currentPage >= 1 && currentPage < 1.5
                  ? Colors.black
                  : Colors.white,
              buttonText1: "Tue",
              buttonText2: "${day + 1}",
              index: 1,
            )),
        SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 1,
            child: CustomButton(
              color:
                  currentPage >= 2 && currentPage < 2.5 ? Colors.white : null,
              onPressed: () {
                pageController.animateToPage(2,
                    duration: Duration(milliseconds: 100),
                    curve: Curves.bounceInOut);
              },
              textColor: currentPage >= 2 && currentPage < 2.5
                  ? Colors.black
                  : Colors.white,
              buttonText1: "Wed",
              buttonText2: "${day + 2}",
              index: 2,
            )),
        SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 1,
            child: CustomButton(
              color:
                  currentPage >= 3 && currentPage < 3.5 ? Colors.white : null,
              onPressed: () {
                pageController.animateToPage(3,
                    duration: Duration(milliseconds: 100),
                    curve: Curves.bounceInOut);
              },
              textColor: currentPage >= 3 && currentPage < 3.5
                  ? Colors.black
                  : Colors.white,
              buttonText1: "Thu",
              buttonText2: "${day + 3}",
              index: 3,
            )),
        SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 1,
            child: CustomButton(
              color:
                  currentPage >= 4 && currentPage < 4.5 ? Colors.white : null,
              onPressed: () {
                pageController.animateToPage(4,
                    duration: Duration(milliseconds: 100),
                    curve: Curves.bounceInOut);
              },
              textColor: currentPage >= 4 && currentPage < 4.5
                  ? Colors.black
                  : Colors.white,
              buttonText1: "Fri",
              buttonText2: "${day + 4}",
              index: 4,
            )),
      ],
    );
  }
}
