import 'package:flutter/material.dart';
import 'package:flutter_play/widgets/calculator/calculator_button.dart';

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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CalculatorButton(
                  child: Text("AC"),
                ),
                CalculatorButton(
                  child: Text("+/-"),
                ),
                CalculatorButton(
                  child: Text("%"),
                ),
                CalculatorButton(
                  child: Text("÷"),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CalculatorButton(
                  child: Text("7"),
                ),
                CalculatorButton(
                  child: Text("8"),
                ),
                CalculatorButton(
                  child: Text("9"),
                ),
                CalculatorButton(
                  child: Text("×"),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CalculatorButton(
                  child: Text("4"),
                ),
                CalculatorButton(
                  child: Text("5"),
                ),
                CalculatorButton(
                  child: Text("6"),
                ),
                CalculatorButton(
                  child: Text("-"),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CalculatorButton(
                  child: Text("1"),
                ),
                CalculatorButton(
                  child: Text("2"),
                ),
                CalculatorButton(
                  child: Text("3"),
                ),
                CalculatorButton(
                  child: Text("+"),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CalculatorButton(
                  child: Text("00"),
                ),
                CalculatorButton(
                  child: Text("0"),
                ),
                CalculatorButton(
                  child: Text("."),
                ),
                CalculatorButton(
                  child: Text("="),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
