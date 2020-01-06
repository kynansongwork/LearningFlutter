import 'package:flutter/material.dart';

class StatelessAction extends StatelessWidget {
  //As it is stateless, the screen is not instantiated again, so does not reset the count.
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    counter++;
    return Container(
      margin: const EdgeInsets.all(20),
      child: Text("Counter Value => $counter")
    );
  }
}