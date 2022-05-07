import 'package:flutter/material.dart';
import 'package:flutter_play/widgets/todo/todo_form.dart';
import 'package:flutter_play/widgets/todo/todo_list.dart';
import 'package:flutter_play/widgets/todo/todo_model.dart';
import 'package:flutter_play/widgets/todo/todo_filter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final List<Todo> _todos = [];
  TodoType _todoType = TodoType.all;

  List<Todo> get _filteredTodos {
    switch (_todoType) {
      case TodoType.active:
        return _todos.where((element) => !element.isCompleted).toList();
      case TodoType.completed:
        return _todos.where((element) => element.isCompleted).toList();
      default:
        return _todos;
    }
  }

  @override
  void initState() {
    super.initState();

    loadTodosFromStorage();
  }

  loadTodosFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    String todosJson = prefs.getString("todos") ?? "";
    if (todosJson.isEmpty == false) {
      setState(() {
        _todos.addAll(Todo.decode(todosJson));
      });
    }
  }

  updateTodosToStorage() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("todos", Todo.encode(_todos));
  }

  handleAddNewTodo(Todo todo) {
    setState(() {
      _todos.insert(0, todo);

      updateTodosToStorage();
    });
  }

  handleToggleComplete(Todo todo) {
    setState(() {
      todo.isCompleted = !todo.isCompleted;

      updateTodosToStorage();
    });
  }

  handleRemove(Todo todo) {
    setState(() {
      _todos.remove(todo);

      updateTodosToStorage();
    });
  }

  handleTypeChanged(TodoType type) {
    setState(() {
      _todoType = type;
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
            todos: _filteredTodos,
            onComplete: handleToggleComplete,
            onRemove: handleRemove,
          ),
          TodoFilter(
            type: _todoType,
            onChanged: handleTypeChanged,
          )
        ],
      ),
    );
  }
}
