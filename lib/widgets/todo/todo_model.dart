import 'dart:convert';

class Todo {
  String id;
  String title;
  bool isCompleted;

  Todo({
    required this.id,
    required this.title,
    required this.isCompleted,
  });

  factory Todo.fromMap(Map<String, dynamic> todo) {
    return Todo(
      id: todo['id'],
      title: todo['title'],
      isCompleted: todo['isCompleted'],
    );
  }

  static Map<String, dynamic> toMap(Todo todo) {
    return {
      'id': todo.id,
      'title': todo.title,
      'isCompleted': todo.isCompleted,
    };
  }

  static String encode(List<Todo> todos) {
    return json.encode(
      todos.map<Map<String, dynamic>>((todo) => Todo.toMap(todo)).toList(),
    );
  }

  static List<Todo> decode(String todos) {
    return (json.decode(todos) as List<dynamic>)
        .map<Todo>((item) => Todo.fromMap(item))
        .toList();
  }
}

enum TodoType { all, active, completed }
