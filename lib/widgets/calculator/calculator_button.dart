import 'dart:math';

import 'package:flutter/material.dart';

class CalculatorButton extends StatefulWidget {
  const CalculatorButton({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  State<CalculatorButton> createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton> {
  bool isPressed = false;

  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    double buttonSize = min((screenWidth(context) - 80) / 4, 96);

    return Listener(
      onPointerUp: handlePointerUp,
      onPointerDown: handlePointerDown,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        child: Center(child: _text(context)),
        width: buttonSize,
        height: buttonSize,
        decoration: _decoration,
      ),
    );
  }

  Text _text(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var style = screenWidth(context) > 320
        ? textTheme.headlineSmall
        : textTheme.subtitle1;

    return Text(widget.text, style: style);
  }

  // Box shadow to give Neumorphism effect
  BoxDecoration get _decoration {
    const distance = Offset(4, 4);
    const blurRadius = 8.0;
    var bottomShadow = BoxShadow(
      color: Colors.grey.shade300,
      offset: distance,
      blurRadius: blurRadius,
    );
    var topShadow = BoxShadow(
      color: Colors.white,
      offset: -distance,
      blurRadius: blurRadius,
    );

    return BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(12),
      boxShadow: !isPressed ? [bottomShadow, topShadow] : null,
    );
  }

  void handlePointerUp(PointerUpEvent _) async {
    await Future.delayed(const Duration(milliseconds: 300));

    setState(() {
      isPressed = false;
    });
  }

  void handlePointerDown(PointerDownEvent _) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Button ${widget.text} pressed!"),
      ),
    );

    setState(() {
      isPressed = true;
    });
  }
}
