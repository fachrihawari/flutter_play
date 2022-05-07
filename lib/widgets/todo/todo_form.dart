import 'package:flutter/material.dart';
import 'package:flutter_play/widgets/todo/todo_model.dart';
import 'package:uuid/uuid.dart';

class TodoForm extends StatefulWidget {
  const TodoForm({Key? key, required this.onSubmit}) : super(key: key);

  final Function(Todo) onSubmit;

  @override
  State<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController todoInputController = TextEditingController();

  _handleSubmit(String value) {
    bool validated = _formKey.currentState?.validate() ?? false;

    if (validated) {
      widget.onSubmit(Todo(
        id: const Uuid().v4(),
        title: value,
        isCompleted: false,
      ));
      _formKey.currentState?.reset();
    }
  }

  String? _handleValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }

    if (value.length < 3) {
      return 'Please put more than 3 characters';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        controller: todoInputController,
        onFieldSubmitted: _handleSubmit,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 16, left: 16, bottom: 16),
          hintText: 'What needs to be done?',
          suffixIcon: IconButton(
            icon: const Icon(Icons.send),
            onPressed: () => _handleSubmit(todoInputController.text),
          ),
        ),
        validator: _handleValidation,
      ),
    );
  }
}
