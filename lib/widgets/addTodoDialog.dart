import 'package:flutter/material.dart';


class AddTodoDialogWidget extends StatefulWidget {
  const AddTodoDialogWidget({super.key});

  @override
  State<AddTodoDialogWidget> createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {

  final _formKey = GlobalKey<FormState>();
  String title = "";
  String description = "";
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Add Todo",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),),
        ],),
    );
  }
}