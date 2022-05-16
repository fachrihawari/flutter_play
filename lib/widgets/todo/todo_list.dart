import 'package:flutter/material.dart';
import 'package:flutter_play/widgets/todo/todo_item.dart';
import 'package:flutter_play/widgets/todo/todo_model.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    Key? key,
    required this.todos,
    required this.onComplete,
    required this.onRemove,
  }) : super(key: key);

  final List<Todo> todos;
  final Function(Todo) onComplete;
  final Function(Todo) onRemove;

  Widget _buildItem(BuildContext context, int index) {
    final todo = todos.elementAt(index);

    return TodoItem(todo: todo, onRemove: onRemove, onComplete: onComplete);
  }

  Widget _buildSeparator(BuildContext _, int __) {
    return const Divider(height: 0);
  }

  Widget _buildList() {
    return ListView.separated(
      itemCount: todos.length,
      separatorBuilder: _buildSeparator,
      itemBuilder: _buildItem,
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Text("Yeay!!! No todos"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: todos.isEmpty ? _buildEmptyState() : _buildList(),
    );
  }
}
