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
    required this.onRemove,
  }) : super(key: key);

  final List<Todo> todos;
  final Function(Todo) onComplete;
  final Function(Todo) onRemove;

  Widget _buildItem(BuildContext context, int index) {
    final item = todos.elementAt(index);

    return Dismissible(
      key: Key("index-$index"),
      onDismissed: (_) => onRemove(item),
      background: Container(color: Colors.red),
      child: ListTile(
        title: Text(
          item.title,
          style: item.isCompleted ? _todoCompleteStyle : null,
        ),
        onTap: () => onComplete(item),
        trailing: item.isCompleted
            ? const Icon(Icons.check_circle, color: Colors.green)
            : null,
      ),
    );
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
