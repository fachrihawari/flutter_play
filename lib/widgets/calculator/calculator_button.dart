import 'package:flutter/material.dart';

class CalculatorButton extends StatefulWidget {
  const CalculatorButton({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  State<CalculatorButton> createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton> {
  bool isPressed = false;

  handlePointerDown(_) {
    setState(() {
      isPressed = true;
    });
  }

  handlePointerUp(_) async {
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() {
      isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double buttonSize = (MediaQuery.of(context).size.width - 80) / 4;

    return Listener(
      onPointerUp: handlePointerUp,
      onPointerDown: handlePointerDown,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        child: Center(
          child:
              Text(widget.text, style: Theme.of(context).textTheme.headline4),
        ),
        width: buttonSize,
        height: buttonSize,
        decoration: _decoration,
      ),
    );
  }

  BoxDecoration get _decoration {
    return BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(12),
      boxShadow: !isPressed
          ? [
              // bottom shadow
              BoxShadow(
                color: Colors.grey.shade300,
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
            ]
          : null,
    );
  }
}
