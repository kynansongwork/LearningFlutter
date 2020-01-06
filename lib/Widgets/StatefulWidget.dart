import 'package:flutter/material.dart';

class NewAction extends StatefulWidget {
  @override
  NewActionApp createState() {
    return NewActionApp();
  }
}

class NewActionApp extends State<NewAction> {
  int counter = 0;
  bool checkTick = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("Counter value => $counter"),
        Checkbox()
      ],
    );
  }
}