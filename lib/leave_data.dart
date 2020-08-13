import 'package:flutter/material.dart';

class LeavesData extends StatelessWidget {
  final int leavesAllowed;
  final int absent;

  LeavesData(this.leavesAllowed, this.absent);

  @override
  Widget build(BuildContext context) {
    int leftLeaves = leavesAllowed - absent;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
            ),
            height: 60.0,
            width: 90.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '$leavesAllowed',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400]),
                ),
                Text(
                  'Leaves Allowed',
                  style: TextStyle(fontSize: 10.0),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
            ),
            height: 60,
            width: 90,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '$absent',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                Text(
                  'Absent',
                  style: TextStyle(fontSize: 10.0),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
            ),
            height: 60,
            width: 90,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '$leftLeaves',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                Text(
                  'Leaves Left',
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// Widget leavesData(int leavesAllowed, int absent) {
//   int leftLeaves = leavesAllowed - absent;

//   return Container();

// return Expanded(
//   child: Center(
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       //crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: <Widget>[
//         Expanded(
//           flex: 1,
//           child: SizedBox(),
//         ),
//         Expanded(
//           flex: 10,
//           child: RaisedButton(
//             shape: new RoundedRectangleBorder(
//               borderRadius: new BorderRadius.circular(5.0),
//             ),
//             disabledColor: Colors.white,
//             onPressed: null,
//             padding: EdgeInsets.all(10.0),
//             child: FittedBox(
//               fit: BoxFit.fill,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                     '$leavesAllowed',
//                     style: TextStyle(
//                       color: Colors.grey[400],
//                       fontSize: 25.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   Text(
//                     'Leaves Allowed',
//                     style: TextStyle(
//                       fontSize: 12,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: SizedBox(),
//         ),
//         Expanded(
//           flex: 10,
//           child: RaisedButton(
//             shape: new RoundedRectangleBorder(
//               borderRadius: new BorderRadius.circular(5.0),
//             ),
//             disabledColor: Colors.white,
//             onPressed: null,
//             padding: EdgeInsets.all(10.0),
//             child: FittedBox(
//               fit: BoxFit.fill,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                     '$absent',
//                     style: TextStyle(
//                       color: Colors.red,
//                       fontSize: 25.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   Text(
//                     'Absent',
//                     style: TextStyle(
//                       fontSize: 12,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: SizedBox(),
//         ),
//         Expanded(
//           flex: 10,
//           child: RaisedButton(
//             shape: new RoundedRectangleBorder(
//               borderRadius: new BorderRadius.circular(5.0),
//             ),
//             disabledColor: Colors.white,
//             onPressed: null,
//             padding: EdgeInsets.all(10.0),
//             child: FittedBox(
//               fit: BoxFit.fill,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                     '$leftLeave',
//                     style: TextStyle(
//                       color: Colors.green,
//                       fontSize: 25.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   Text(
//                     'Left Leaves',
//                     style: TextStyle(
//                       fontSize: 12,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         //SizedBox(width: 20,),
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
//       ],
//     ),
//   ),
// );

Widget dataWidget(int num, String string) {
  return RaisedButton(
    shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(5.0),
    ),
    disabledColor: Colors.white,
    onPressed: null,
    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          '$num',
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          '$string',
          style: TextStyle(
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
