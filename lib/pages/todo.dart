import 'package:flutter/material.dart';
import 'package:flutter_play/widgets/todo/todo_form.dart';
import 'package:flutter_play/widgets/todo/todo_list.dart';
import 'package:flutter_play/widgets/todo/todo_model.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final List<Todo> _todos = [];

  handleAddNewTodo(Todo todo) {
    setState(() {
      _todos.add(todo);
    });
  }

  handleToggleComplete(Todo todo) {
    setState(() {
      todo.isCompleted = !todo.isCompleted;
    });
  }

  handleRemove(Todo todo) {
    setState(() {
      _todos.remove(todo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
      body: Column(
        children: [
          TodoForm(onSubmit: handleAddNewTodo),
          TodoList(
            todos: _todos,
            onComplete: handleToggleComplete,
            onRemove: handleRemove,
          )
        ],
      ),
    );
  }
}
