import 'package:flutter/material.dart';

class PaddingPage extends StatefulWidget {
  PaddingPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PaddingPageState createState() => _PaddingPageState();
}

class _PaddingPageState extends State<PaddingPage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(color: Colors.white, width: double.infinity, height: 100,),
        Expanded(
          child: Scaffold(
            appBar: new AppBar(
              title: new Text('Page Title'),
            ),
            body: new Center(
              child: new Text('Hello World'),
            ),
          ),
        ),
      ],
    );
  }
}