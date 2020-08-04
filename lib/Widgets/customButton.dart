import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{
  final VoidCallback onPressed;
  final Color color;
  final String buttonText1;
  final String buttonText2;
  final Color textColor;
  final int index;

  CustomButton({this.onPressed, this.color, this.buttonText1, this.buttonText2 , this.textColor , this.index});

  @override
  Widget build(BuildContext context){
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5)),
      color: color,
      textColor: textColor,
      padding: EdgeInsets.fromLTRB(0,3,0,3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(flex: 1,child: Center(child:Text(buttonText1))),
          Expanded(flex: 1,child: Center(child: Text(buttonText2))),
          Expanded(
            flex: 1,
            child: Container(
              height:4,
              width: 4,
              decoration: BoxDecoration(
                color: DateTime.now().weekday ==index +1 ?Colors.amber:null,
                shape: BoxShape.circle,
              ),
            ),
          )
        ],
      )
    );
  }
}