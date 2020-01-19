
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'New_Data.dart';

void main() => runApp(App());
class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: API(),
    );
  }
}