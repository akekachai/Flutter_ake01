import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _Homepage createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            Text('home'),
          ],
        ),
      )),
    );
  }
}
