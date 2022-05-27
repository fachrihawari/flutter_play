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
                  text: "AC",
                ),
                CalculatorButton(
                  text: "+/-",
                ),
                CalculatorButton(
                  text: "%",
                ),
                CalculatorButton(
                  text: "÷",
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CalculatorButton(
                  text: "7",
                ),
                CalculatorButton(
                  text: "8",
                ),
                CalculatorButton(
                  text: "9",
                ),
                CalculatorButton(
                  text: "×",
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CalculatorButton(
                  text: "4",
                ),
                CalculatorButton(
                  text: "5",
                ),
                CalculatorButton(
                  text: "6",
                ),
                CalculatorButton(
                  text: "-",
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CalculatorButton(
                  text: "1",
                ),
                CalculatorButton(
                  text: "2",
                ),
                CalculatorButton(
                  text: "3",
                ),
                CalculatorButton(
                  text: "+",
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CalculatorButton(
                  text: "00",
                ),
                CalculatorButton(
                  text: "0",
                ),
                CalculatorButton(
                  text: ".",
                ),
                CalculatorButton(
                  text: "=",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
