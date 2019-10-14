import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final Icon icon;
  final Function callback;

  RoundButton({this.icon, this.callback});


  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: callback,
      fillColor: Color(0xFF111328),
      highlightColor: Colors.pinkAccent,
      child: icon,
      elevation: 6.0,
      constraints: BoxConstraints(
        minHeight: 56, minWidth: 56,
      ),
      shape: CircleBorder(),
    );
  }
}