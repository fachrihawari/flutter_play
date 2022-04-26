import 'package:flutter/material.dart';
import 'package:flutter_play/pages/launchpad.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Play',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const Launchpad(),
    );
  }
}
