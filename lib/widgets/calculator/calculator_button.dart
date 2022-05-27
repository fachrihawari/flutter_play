import 'package:flutter/material.dart';

class CalculatorButton extends StatefulWidget {
  const CalculatorButton({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  State<CalculatorButton> createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    double buttonSize = (MediaQuery.of(context).size.width - 80) / 4;

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
    return Text(widget.text, style: Theme.of(context).textTheme.headline5);
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
    setState(() {
      isPressed = true;
    });
  }
}
