import 'package:flutter/material.dart';

Widget leavesData(int leavesAllowed, int absent) {
  int leftLeave = leavesAllowed - absent;

  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        //SizedBox(width: 20,),
        Container(
          height: 70.0,
          width: 100.0,
          child: RaisedButton(
            disabledColor: Colors.white,
            onPressed: null,
            padding: EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$leavesAllowed',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Leaves Allowed',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        //SizedBox(width: 10,),
        Container(
          height: 70.0,
          width: 100.0,
          child: RaisedButton(
            disabledColor: Colors.white,
            onPressed: null,
            padding: EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$absent',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Absent',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        //SizedBox(width: 10,),
        Container(
          height: 70.0,
          width: 100.0,
          child: RaisedButton(
            disabledColor: Colors.white,
            onPressed: null,
            //hoverElevation: 100,
            padding: EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$leftLeave',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Left Leaves',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        //SizedBox(width: 20,),
//                SizedBox(width: 20,),
//                Expanded(
//                  child: FractionallySizedBox(
////                    widthFactor:0.8,
//                    child: Container(
//                      color: Colors.white,
////                      padding: EdgeInsets.all(20),
//                      child: Column(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        crossAxisAlignment: CrossAxisAlignment.center,
//                        children: <Widget>[
//                          Text(
//                            '$leaveAllowed',
//                            style: TextStyle(
//                              color: Colors.grey[400],
//                              fontSize: 25.0,
//                              fontWeight: FontWeight.bold,
//                            ),
//                            textAlign: TextAlign.center,
//                          ),
//                          Text(
//                            'Leaves Allowed',
//                            style: TextStyle(
//                              fontSize: 12,
//                            ),
//                            textAlign: TextAlign.center,
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                ),
//                SizedBox(width: 10,),
//                Expanded(
//                  child: FractionallySizedBox(
////                    widthFactor:0.8,
//                    child: Container(
//                      color: Colors.white,
////                      padding: EdgeInsets.all(20),
//                      child: Column(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        crossAxisAlignment: CrossAxisAlignment.center,
//                        children: <Widget>[
//                          Text(
//                            '$absent',
//                            style: TextStyle(
//                              color: Colors.red,
//                              fontSize: 25.0,
//                              fontWeight: FontWeight.bold,
//                            ),
//                            textAlign: TextAlign.center,
//                          ),
//                          Text(
//                            'Absent',
//                            style: TextStyle(
//                              fontSize: 12,
//                            ),
//                            textAlign: TextAlign.center,
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                ),
//                SizedBox(width: 10,),
//                Expanded(
//                  child: FractionallySizedBox(
////                    widthFactor:0.8,
//                    child: Container(
//                      color: Colors.white,
////                      padding: EdgeInsets.all(20),
//                      child: Column(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        crossAxisAlignment: CrossAxisAlignment.center,
//                        children: <Widget>[
//                          Text(
//                            '$leftLeave',
//                            style: TextStyle(
//                              color: Colors.green,
//                              fontSize: 25.0,
//                              fontWeight: FontWeight.bold,
//                            ),
//                            textAlign: TextAlign.center,
//                          ),
//                          Text(
//                            'Left Leaves',
//                            style: TextStyle(
//                              fontSize: 12,
//                            ),
//                            textAlign: TextAlign.center,
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                ),
//                SizedBox(width: 20,),
//                Expanded(
//                  child: Column(
//                    children: <Widget>[
//                      Text('Leaves Allowed'),
//                    ],
//                  ),
//                ),
//                Expanded(
//                  child: Column(
//                    children: <Widget>[
//                      Text('Absent'),
//                    ],
//                  ),
//                ),
//                Expanded(
//                  child: Column(
//                    children: <Widget>[
//                      Text('Left Leaves'),
//                    ],
//                  ),
//
      ],
    ),
  );
}
