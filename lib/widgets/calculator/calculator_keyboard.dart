import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_play/widgets/calculator/calculator_button.dart';

class CalculatorKeyboard extends StatelessWidget {
  const CalculatorKeyboard({Key? key}) : super(key: key);

  final List<List<String>> buttonGroups = const [
    ["AC", "+/-", "%", "÷"],
    ["7", "8", "9", "×"],
    ["4", "5", "6", "-"],
    ["1", "2", "3", "+"],
    ["00", "0", ".", "="]
  ];

  @override
  Widget build(BuildContext context) {
    double width = min(MediaQuery.of(context).size.width, 464);

    return SizedBox(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var buttons in buttonGroups) ..._buildRow(buttons),
        ],
      ),
    );
  }

  List<Widget> _buildRow(List<String> buttons) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (var button in buttons) CalculatorButton(text: button),
        ],
      ),
      if (buttonGroups.indexOf(buttons) < buttonGroups.length - 1)
        const SizedBox(height: 16)
    ];
  }
}
