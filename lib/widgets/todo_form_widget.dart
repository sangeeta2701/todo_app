import 'package:flutter/material.dart';
import 'package:todo_app/widgets/sizedBox.dart';

class TodoFormWidget extends StatelessWidget {
  const TodoFormWidget(
      {super.key,
      this.title = "",
      this.description = "",
      required this.onChangedDescription,
      required this.onChangedTitle,
      required this.onSavedTodo});
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buidTitle(),
          height12,
          buildDescription(),
          height32,
          buildButton(),
        ],
      ),
    );
  }

  Widget buidTitle() {
    return TextFormField(
      initialValue: title,
      onChanged: onChangedTitle,
      maxLines: 1,
      validator: (title) {
        if (title!.isEmpty) {
          return "The title cannot be empty";
        }
        return null;
      },
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: "Title",
      ),
    );
  }

  Widget buildDescription() {
    return TextFormField(
      initialValue: description,
      onChanged: onChangedDescription,
      maxLines: 4,
      validator: (description) {
        if (description!.isEmpty) {
          return "The description cannot be empty";
        }
        return null;
      },
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: "Description",
      ),
    );
  }

  Widget buildButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(onPressed: onSavedTodo,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black)
      ), child: Text("Save"),),
    );
  }
}
