import 'package:flutter/material.dart';
import 'package:flutter_play/widgets/todo/todo_model.dart';

class TodoForm extends StatefulWidget {
  const TodoForm({Key? key, required this.onSubmit}) : super(key: key);

  final Function(Todo) onSubmit;

  @override
  State<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  handleSubmit(String value) {
    bool validated = _formKey.currentState?.validate() ?? false;

    if (validated) {
      widget.onSubmit(Todo(title: value, isCompleted: false));
      _formKey.currentState?.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        onFieldSubmitted: handleSubmit,
        decoration: const InputDecoration(
          hintText: 'What needs to be done?',
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }

          if (value.length <= 3) {
            return 'Please put more than 3 characters';
          }

          return null;
        },
      ),
    );
  }
}
