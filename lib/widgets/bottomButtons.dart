import 'package:flutter/material.dart';

class BottomButtons extends StatelessWidget {
  VoidCallback donePressed;
  VoidCallback cancelPressed;
  BottomButtons({this.donePressed, this.cancelPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
          child: Text("DONE",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  color: Colors.blueGrey)),
          onPressed: () => donePressed(),
        ),
        RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
          child: Text("CANCEL",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  color: Colors.red[400])),
          onPressed: () => cancelPressed(),
        )
      ],
    );
  }
}