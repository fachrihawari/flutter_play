import 'package:flutter/material.dart';
import 'package:flutter_play/widgets/calculator/calculator_display.dart';
import 'package:flutter_play/widgets/calculator/calculator_keyboard.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [CalculatorDisplay(), CalculatorKeyboard()],
        ),
      ),
    );
  }
}
