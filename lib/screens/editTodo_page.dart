import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/provider/todos.dart';
import 'package:todo_app/widgets/todo_form_widget.dart';

class EditTodoPage extends StatefulWidget {
  const EditTodoPage({super.key, required this.todo});
  final Todo todo;

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  final _formKey = GlobalKey<FormState>();
  String? title;
  String? description;

  @override
  void initState() {
    super.initState();
    title = widget.todo.title;
    description = widget.todo.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Todo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: TodoFormWidget(
              title: title!,
              description: description!,
              onChangedDescription: (description) {
                setState(() {
                  this.description = description;
                });
              },
              onChangedTitle: (title) {
                setState(() {
                  this.title = title;
                });
              },
              onSavedTodo: saveTodo),
        ),
      ),
    );
  }

  void saveTodo() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.updateTodo(widget.todo, title!, description!);
      Navigator.pop(context);
    }
  }
}
