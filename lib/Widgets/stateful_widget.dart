import 'package:flutter/material.dart';

class StatefulAction extends StatefulWidget {
  @override
  StatefulActionScreen createState() {
    return StatefulActionScreen();
  }
}

class StatefulActionScreen extends State<StatefulAction> {
  int counter = 0;
  bool checkTick = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          Text("Counter value => $counter"),
          Checkbox(
            value: checkTick,
            onChanged: (newTick) {
              setState(() {
                counter++;
                checkTick = newTick;
              });
            },
          )
        ],
      )
    );
  }
}