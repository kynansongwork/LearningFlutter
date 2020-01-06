import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker_modern/image_picker_modern.dart';

class StatefulAction extends StatefulWidget {
  @override
  StatefulActionScreen createState() {
    return StatefulActionScreen();
  }
}

class StatefulActionScreen extends State<StatefulAction> {
  int counter = 0;
  bool checkTick = false;
  File _image;

  Future getImage() async {
  var image = await ImagePicker.pickImage(source: ImageSource.gallery);

  setState(() {
    _image = image;
  });
}

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
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(20),
              height: 400,
              width: 600,
              child: _image == null ? Text('No image selected.', textAlign: TextAlign.center,) : Image.file(_image),
            )
          ),
          FlatButton(
            color: Colors.blue,
            padding: EdgeInsets.all(20),
            onPressed: getImage,
            child: Icon(Icons.add_a_photo),
          ),
        ],
      )
    );
  }
}