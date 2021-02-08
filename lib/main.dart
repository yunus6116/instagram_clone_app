import 'package:flutter/material.dart';

import './pages/root_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone App',
      debugShowCheckedModeBanner: false,
      home: RootApp(),
    );
  }
}
