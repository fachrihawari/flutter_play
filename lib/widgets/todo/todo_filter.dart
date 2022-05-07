import 'package:flutter/material.dart';
import 'package:flutter_play/widgets/todo/todo_model.dart';

class TodoFilter extends StatelessWidget {
  const TodoFilter({
    Key? key,
    required this.type,
    required this.onChanged,
  }) : super(key: key);

  final TodoType type;
  final Function(TodoType) onChanged;

  @override
  Widget build(BuildContext context) {
    double itemWidth = (MediaQuery.of(context).size.width - 32) / 3;

    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      child: ToggleButtons(
        borderRadius: BorderRadius.circular(23),
        constraints: BoxConstraints.expand(width: itemWidth, height: 46),
        onPressed: (index) {
          TodoType newType = TodoType.values.elementAt(index);
          if (newType != type) {
            onChanged(newType);
          }
        },
        isSelected: [
          type == TodoType.all,
          type == TodoType.active,
          type == TodoType.completed,
        ],
        children: const [
          Text("All"),
          Text("Active"),
          Text("Completed"),
        ],
      ),
    );
  }
}
