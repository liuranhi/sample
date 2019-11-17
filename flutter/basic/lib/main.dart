import 'package:flutter/material.dart';
import 'package:basic/ui/home_page.dart';
import 'package:basic/ui/listview_card_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test App',
      theme: new ThemeData.dark(),
      home: HomePage(title: 'Home Page'),
      // home:ListviewCardPage(title: 'Listview Card Page'),
    );
  }
}