import 'package:flutter/material.dart';
import 'package:flutter_play/widgets/todo/todo_model.dart';

const _todoCompleteStyle = TextStyle(
  decoration: TextDecoration.lineThrough,
  fontStyle: FontStyle.italic,
);

class TodoList extends StatelessWidget {
  const TodoList({
    Key? key,
    required this.todos,
    required this.onComplete,
  }) : super(key: key);

  final List<Todo> todos;
  final Function(Todo) onComplete;

  Widget _buildItem(BuildContext context, int index) {
    final item = todos.elementAt(index);

    return ListTile(
      title: Text(
        item.title,
        style: item.isCompleted ? _todoCompleteStyle : null,
      ),
      onTap: () => onComplete(item),
      trailing: item.isCompleted ? const Icon(Icons.check_circle) : null,
    );
  }

  Widget _buildSeparator(BuildContext _, int __) {
    return const Divider(height: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: todos.length,
        separatorBuilder: _buildSeparator,
        itemBuilder: _buildItem,
      ),
    );
  }
}
