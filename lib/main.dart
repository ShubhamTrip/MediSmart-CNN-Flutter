import 'package:flutter/material.dart';
import 'package:majorold/Instruction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Covid Detector",
      home: Instructions(),
      debugShowCheckedModeBanner: false,
    );
  }
}
