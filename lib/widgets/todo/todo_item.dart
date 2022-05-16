import 'package:flutter/material.dart';
import 'package:flutter_play/widgets/todo/todo_model.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    Key? key,
    required this.todo,
    required this.onRemove,
    required this.onComplete,
  }) : super(key: key);

  final Todo todo;
  final Function(Todo) onRemove;
  final Function(Todo) onComplete;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(todo.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onRemove(todo),
      background: _buildBackground(),
      child: _buildTile(),
    );
  }

  Widget _buildBackground() {
    return Container(
      color: Colors.red,
      alignment: AlignmentDirectional.centerEnd,
      child: const Padding(
        padding: EdgeInsets.only(right: 16),
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildTile() {
    return ListTile(
      title: Text(
        todo.title,
        style: todo.isCompleted ? _todoCompleteStyle : null,
      ),
      onTap: () => onComplete(todo),
      trailing: todo.isCompleted
          ? const Icon(Icons.check_circle, color: Colors.green)
          : null,
    );
  }
}

const _todoCompleteStyle = TextStyle(
  decoration: TextDecoration.lineThrough,
  fontStyle: FontStyle.italic,
);
