import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    double buttonSize = (MediaQuery.of(context).size.width - 80) / 4;

    return Container(
      child: Center(child: child),
      width: buttonSize,
      height: buttonSize,
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          // bottom shadow
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(4, 4),
            blurRadius: 8,
            spreadRadius: 0,
          ),
          // top shadow
          const BoxShadow(
            color: Colors.white,
            offset: Offset(-4, -4),
            blurRadius: 8,
            spreadRadius: 0,
          )
        ],
      ),
    );
  }
}
